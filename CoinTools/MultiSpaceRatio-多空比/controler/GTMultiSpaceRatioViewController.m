//
//  GTMultiSpaceRatioViewController.m
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTMultiSpaceRatioViewController.h"

#import "GateTopSelectView.h"
#import "GateHearCategoryView.h"
#import "pressView.h"
#import "GatePrgessTableViewCell.h"
#import "GateHearView.h"
#import "GateData1TableViewCell.h"
#import "GateData2TableViewCell.h"
#import "GateLineChartTableViewCell.h"
#import "GateBurstViewController.h"
#import "GTTopTotalTableViewCell.h"
#import "GateHoursSelectCategoryView.h"
#import "GTFearIndexLineChartsTableViewCell.h"
#import "GTFearIndexModel.h"
#import "GTDuoKongSelectTimeTopView.h"
#import "GTDuoKongLineChartsTableViewCell.h"
@interface GTMultiSpaceRatioViewController ()
@property(nonatomic,strong)pressView *press;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
//@property(nonatomic,strong)GateHomeModel *gateHomeModel;
//@property(nonatomic,strong)GTSpaceRatioModel *spaceRatioModel;

@property(nonatomic,copy)NSString *type;


@property (nonatomic, strong) NSMutableArray *spaceRatioModels;
@property (nonatomic, strong) NSMutableArray *dataArrs;

@property(nonatomic,strong) GateTopSelectView * topSelectView;

@property(nonatomic,strong)GTSpaceRatioModel *spaceRatioModel;

@property(nonatomic,strong)GTDuoKongSelectTimeTopView *duoKongSelectTimeTopView;

@property(nonatomic,copy)NSString *v_ts;
@property(nonatomic,copy)NSString *v_pic_ts;
@property(nonatomic,copy)NSString *v_coin_type;
@property(nonatomic,assign)NSInteger v_pic_tsIndex;


@end

@implementation GTMultiSpaceRatioViewController
-(NSMutableArray *)spaceRatioModels{
    if (!_spaceRatioModels) {
        _spaceRatioModels = [NSMutableArray array];
    }
    return _spaceRatioModels;
}

-(NSMutableArray *)dataArrs{
    if (!_dataArrs) {
        _dataArrs = [NSMutableArray array];
    }
    return  _dataArrs;
}


-(GTDuoKongSelectTimeTopView *)duoKongSelectTimeTopView{
    if (!_duoKongSelectTimeTopView) {
        @weakify(self)
        _duoKongSelectTimeTopView = [[GTDuoKongSelectTimeTopView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 50)];
        _duoKongSelectTimeTopView.selectblock = ^(NSInteger index) {
            
            @strongify(self)
            [self v_tsSelect:index];
            
        };
    }
    return _duoKongSelectTimeTopView;
}

-(void)v_tsSelect:(NSInteger)index{
    if (index == 0) {
        self.v_ts = @"4h";
    }else if(index == 1){
        self.v_ts = @"1h";
    }else if(index == 2){
        self.v_ts = @"5m";
    }
    [self loadDataDefult:NO];
}
-(void)v_pic_tsSelect:(NSInteger)index{
    self.v_pic_tsIndex = index;
    if (index == 0) {
        self. v_pic_ts =  @"1d";
    }else{
        self. v_pic_ts =  @"1w";
    }
    [self loadDataDefult:NO];
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCreateTable];
   
    self.tableView.tableHeaderView  =self.duoKongSelectTimeTopView;
    
       @weakify(self)
          [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
               @strongify(self)
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [self loadDataDefult:NO];
                 
                });
          }];
    self.v_ts = @"4h";
    self. v_pic_ts =  @"1d";
    self.v_coin_type =  @"ALL";
    [self loadDataDefult:YES];
}
-(void)selectitemOrindex:(NSInteger)index string:(nonnull NSString *)title{
    self.v_coin_type = title;
    [self.tableView startRefreshing];
   
   
}


-(void)loadDataDefult:(BOOL)isDefult{
    NSString * url = isDefult?duokongURL:v_coin_type_v_pic_tsURL(self.v_coin_type, self.v_ts, self.v_pic_ts);
    NSLog(@"%@",url);
    [GTStyleManager loadingImage];
    @weakify(self)
   
    [GateRequestManager getCache:url block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
   
        @strongify(self)
       
        if (!error) {
            self.isError = NO;
            self.spaceRatioModel =[GTSpaceRatioModel modelWithDictionary:response[@"data"]];
            if(!isDefult){
                [self.dataArrs removeAllObjects];
                if (self.spaceRatioModel.lsalldtl) {
                    [self.dataArrs addObject:self.spaceRatioModel.lsalldtl];
                }
                if (self.spaceRatioModel.Okex_quarter) {
                    [self.dataArrs addObject:self.spaceRatioModel.Okex_quarter];
                }
                if (self.spaceRatioModel.Okex_swap) {
                    [self.dataArrs addObject:self.spaceRatioModel.Okex_swap];
                }
                if (self.spaceRatioModel.All) {
                    [self.dataArrs addObject:self.spaceRatioModel.All];
                }
                if (self.spaceRatioModel.Huobi_quarter) {
                    [self.dataArrs addObject:self.spaceRatioModel.Huobi_quarter];
                }
                
                
        }
            
           
        }else{
            self.isError = YES;
        }
           if (!isCache) {
               [EasyLodingView hidenLoding];
               [self.tableView endRefreshing];
               [self.tableView cyl_reloadData];
               
           }
        [self.tableView cyl_reloadData];
        if (self.spaceRatioModel.lsalldtl.alldatalist.count/3<=0) {
            [self.tableView  bringSubviewToFront:self.duoKongSelectTimeTopView];
        }
       
 
          
    }];

}

-(void)registerCreateTable{
    
    
      gateTableRegisterNib(self.tableView, @"GatePrgessTableViewCell");
     gateTableRegisterNib(self.tableView, @"GTTopTotalTableViewCell");
     gateTableRegisterNib(self.tableView, @"GTDuoKongLineChartsTableViewCell");
    self.tableView.dataSource = self;
     self.tableView.delegate = self;
    self.tableView.backgroundColor = UIColor.whiteColor;

     [self.view addSubview:self.tableView];
   
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

   
    if (self.topSelectView.categoryView.selectedIndex == 0) {
 
                  GateHearView  * hearView  = [GateHearView getGateHearView];
                hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
       
                 hearView.nameLb.text = [GTDataManager getItemModelWhit:self.spaceRatioModel.lsalldtl.alldatalist[section *3].datalist.firstObject].firstObject.content;
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.spaceRatioModel.lsalldtl.alldatalist[section *3].datalist.firstObject].firstObject forLale:hearView.nameLb];
        return hearView;
    }else{
        if (section == 0) {
        
            GTPublicContentModel *publicContentModel = self.dataArrs[section];
            GateHearView  * hearView  = [GateHearView getGateHearView];
             hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
            hearView.nameLb.text = [GTDataManager getItemModelWhit:publicContentModel.alldatalist.firstObject.datalist.firstObject].firstObject.content;
            [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:publicContentModel.alldatalist.firstObject.datalist.firstObject].firstObject forLale: hearView.nameLb];
              return hearView;
          }else{
               GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                selectCategoryView.categoryView.defaultSelectedIndex = self.v_pic_tsIndex;
                                               selectCategoryView.titles =  @[@"1D",@"1W"];
              selectCategoryView.titleLb.text = [GTDataManager getItemModelWhit:self.spaceRatioModel.lsbigtitle.alldatalist.firstObject.datalist.firstObject][section].content;
              [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.spaceRatioModel.lsbigtitle.alldatalist.firstObject.datalist.firstObject][section] forLale:selectCategoryView.titleLb];
             
                                               selectCategoryView.selectblock = ^(NSInteger index) {
                                                   
                                                   [self v_pic_tsSelect:index];

                                            };

         
                                       return selectCategoryView;
          }
    }
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{

      return 50;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (self.selectedIndex == 0) {
        if (indexPath.row == 0)return 50;
              return 80;
      
    }else{
            
        if (indexPath.section == 0) {
            if (indexPath.row == 0) return 50;
            return 80;
        }else{
               
            CGFloat height = [tableView
                              fd_heightForCellWithIdentifier:@"GTDuoKongLineChartsTableViewCell"
                              cacheByIndexPath:indexPath
                              configuration:^(id cell) {
    
                               }];
            return height;
              
            }
    }
   
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     
     if (self.selectedIndex == 0) {
         return self.spaceRatioModel.lsalldtl.alldatalist.count/3;
     }else{
         return self.dataArrs.count>0? self.dataArrs.count:0;
     }
     
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (self.selectedIndex == 0) {
       NSArray * arr = [GTDataManager getItemModelWhit:self.spaceRatioModel.lsalldtl.alldatalist[section *3].datalist.firstObject] ;
       return arr.count>0?arr.count:0;
    }else{
        GTPublicContentModel *publicContentModel = self.dataArrs[section];
      
//        return [GTDataManager getItemModelWhit:spaceRatioModel.alldatalist[section *3].datalist.firstObject];
//        [GTDataManager getItemModelWhit:publicContentModel.alldatalist.firstObject.datalist.firstObject]
           if (section == 0) {
               return publicContentModel.alldatalist.firstObject.datalist.firstObject.count>0?publicContentModel.alldatalist.firstObject.datalist.firstObject.count:0;
           }else{
               return  self.dataArrs.count>0? 1:0;
           }
        
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    if (self.topSelectView.categoryView.selectedIndex == 0) {
        if (indexPath.row == 0) {
                             
                GTTopTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTTopTotalTableViewCell" forIndexPath:indexPath];
           
            cell.indexPath = indexPath;
            cell.lsalldtl = self.spaceRatioModel.lsalldtl;
                                  return cell;
            }else{
               
                GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
                cell.indexPath = indexPath;
                cell.lsalldtl = self.spaceRatioModel.lsalldtl;
                       
                                         return cell;
                              }
    }else{
        if (indexPath.section == 0) {
            GTPublicContentModel *publicContentModel = self.dataArrs[indexPath.section];
                if (indexPath.row == 0) {
                    GTTopTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTTopTotalTableViewCell" forIndexPath:indexPath];
                    cell.backgroundColor = [UIColor whiteColor];
                    cell.indexPath = indexPath;
                    cell.lsalldtl = publicContentModel;
                           return cell;
                }else{
                 GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
                    cell.indexPath = indexPath;
                    cell.lsalldtl = publicContentModel;
                                  return cell;
                }
            }else{
                 GTDuoKongLineChartsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTDuoKongLineChartsTableViewCell" forIndexPath:indexPath];
                GTPublicContentModel *publicContentModel = self.dataArrs[indexPath.section];
                cell.duoKongData = publicContentModel;
                                return cell;
            }
    }
  
   
}
#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
//    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


@end
