//
//  GateWholeNetworkPositionStatisticsViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/4.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateWholeNetworkPositionStatisticsViewController.h"
#import "GateLineChartTableViewCell.h"
#import "GateHousBurstStatisticsTableViewCell.h"
#import "GateDeliveryPositionAmountCell.h"
#import "GateTopSelectView.h"
#import "GateHoursSelectCategoryView.h"
@interface GateWholeNetworkPositionStatisticsViewController ()
@property(nonatomic,strong)NSArray * littes;
@property (nonatomic, assign) NSInteger index;
@property(nonatomic,strong)NSMutableArray * lineDatas;
@property (nonatomic, copy) NSString * v_ts;
@property (nonatomic, copy) NSString * v_coin_type;
@property(nonatomic,strong)GTHoldModel * holdModel;

@end
@implementation GateWholeNetworkPositionStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"大单成交统计";
    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);

       self.tableView.backgroundColor = [UIColor whiteColor];
    
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
    
    
    gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
  
    
    
       @weakify(self)
          [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
               @strongify(self)
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   if (self.selectedIndex == 0) {
                       [self loadData];
                   }else{
                       [self loadData1];
                   }
                

                  });
          }];
       
       [EasyLodingView showLodingText:@"" imageName:getImageName(@"loading_0_30x30_@3x") config:^EasyLodingConfig *{
           return [EasyLodingConfig shared].setLodingType(LodingShowTypeImageAround).setTintColor(UIColor.redColor).setBgColor([[UIColor grayColor] colorWithAlphaComponent:0.2]);
       }];
       [self loadData];
//    [self setDate];
}







-(void)loadData{
    @weakify(self)
           self.index = 0;
     [GateRequestManager getCache:chiCongURL block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.holdModel = [GTHoldModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
         [self.tableView cyl_reloadData];
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
       
                           
        
    }];
    
}
-(void)selectitemOrindex:(NSInteger)index string:(nonnull NSString *)title{
    self.v_coin_type = title;
    [self.tableView endRefreshing];
    [self.tableView startRefreshing];
   
   
}
-(void)loadData1{
    @weakify(self)
   
     [GateRequestManager getCache:baocang_v_coin_typeURL(self.v_coin_type) block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.holdModel = [GTHoldModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
        
         [self.tableView cyl_reloadData];
        
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
      
    }];
    
}

-(void)loadData2{
    @weakify(self)
    [GTStyleManager loadingImage];
    NSLog(@"%@",baocang_v_tsURL(self.v_coin_type,self.v_ts));
     [GateRequestManager getCache:baocang_v_tsURL(@"all",self.v_ts) block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.holdModel = [GTHoldModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
         [self.tableView cyl_reloadData];
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
        
  
    }];
    
}







-(void)setDate{
    self.lineDatas = [NSMutableArray array];
    
    GateDiffLineModel * lineModel = [[GateDiffLineModel alloc] init];
    lineModel.line = [NSArray arrayWithObjects:@[@"9/13",@"200"],@[@"9/14",@"400"],@[@"9/15",@"250"],@[@"9/16",@"120"], nil];
    lineModel.name = @"Huobi合约"; lineModel.titleText =  @"OKEx合约";
    
    GateDiffLineModel * lineModel2 = [[GateDiffLineModel alloc] init];
       lineModel2.line = [NSArray arrayWithObjects:@[@"9/13",@"300"],@[@"9/14",@"150"],@[@"9/15",@"280"],@[@"9/16",@"600"], nil];
        lineModel2.name = @"OKEx合约"; lineModel2.titleText =  @"OKEx合约";
    [self.lineDatas addObject:lineModel];
      [self.lineDatas addObject:lineModel2];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)  return   self.holdModel.holdcontract.alldatalist[1].datalist.firstObject.count;;
    if (section == 1)  return 1;
    if (section == 2)  return 4;
    
    return 1 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
               selectCategoryView.titles =  @[];
           selectCategoryView.title = @"全网实时持仓量";
               selectCategoryView.selectblock = ^(NSInteger index) {
                   
               };
                   return selectCategoryView;
    }else  if (section == 1){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                        selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
                    
                        selectCategoryView.selectblock = ^(NSInteger index) {
                            
                        };
                            return selectCategoryView;

    }else  if (section == 2){
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                     selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
                 
                     selectCategoryView.selectblock = ^(NSInteger index) {
                         
                     };
                         return selectCategoryView;
    }else{
       return  [UIView new];
    }

   
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
//                 GateWholeNetworkBigOrderStatisticsCell *cell1 = cell;
//                 cell1.arr = @[];
                                        }];
                     return height;
       }else if (indexPath.section == 1) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateLineChartTableViewCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
              
                                        }];
                     return height;
       }else if (indexPath.section == 2) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateDeliveryPositionAmountCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
              
                                        }];
                     return height;
       }else {
           return 50;
      }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       
        GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
        cell.indexPath = indexPath;
        cell.burstbourse = self.holdModel.holdcontract;
                                           return cell;
       }else if (indexPath.section == 1) {
              GateLineChartTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateLineChartTableViewCell" forIndexPath:indexPath];
           cell.possArr = self.lineDatas;
                    return cell;
            }else if (indexPath.section == 2) {
              GateDeliveryPositionAmountCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateDeliveryPositionAmountCell" forIndexPath:indexPath];
                           return cell;
            }else  {
                       return nil;
       }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}
@end
