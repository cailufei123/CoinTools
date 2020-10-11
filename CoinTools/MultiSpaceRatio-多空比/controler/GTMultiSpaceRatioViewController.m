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
#import "GateHomeModel.h"
#import "GateBurstViewController.h"
#import "GTTopTotalTableViewCell.h"
#import "GateHoursSelectCategoryView.h"
#import "GTFearIndexLineChartsTableViewCell.h"
#import "GTFearIndexModel.h"
#import "GateHomeModel.h"

#import "GTDuoKongLineChartsTableViewCell.h"
@interface GTMultiSpaceRatioViewController ()
@property(nonatomic,strong)pressView *press;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic,strong)GateHomeModel *gateHomeModel;
@property(nonatomic,strong)GTSpaceRatioModel *spaceRatioModel;

@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)NSInteger selectIndex;

@property (nonatomic, strong) NSMutableArray *spaceRatioModels;
@property (nonatomic, strong) NSMutableArray *bcoin_coin_long_short_infos;

@property(nonatomic,strong) GateTopSelectView * topSelectView;

@property(nonatomic,strong)GTCoinSpaceRatioModel *coinSpaceRatioModel;

@end

@implementation GTMultiSpaceRatioViewController
-(NSMutableArray *)spaceRatioModels{
    if (!_spaceRatioModels) {
        _spaceRatioModels = [NSMutableArray array];
    }
    return _spaceRatioModels;
}
-(NSMutableArray *)bcoin_coin_long_short_infos{
    if (!_bcoin_coin_long_short_infos) {
           _bcoin_coin_long_short_infos = [NSMutableArray array];
    }
      return _bcoin_coin_long_short_infos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"合约";
    self.type = @"BTC";
    [self creatTopSelectView];
    [self registerCreateTable];
    [self loadData];
}

-(void)loadData{



    __weak typeof(self) wself = self;
         [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
          
                
             if(self.topSelectView.categoryView.selectedIndex == 0){
                 
                        [GateRequestManager get:duokongURL block:^(NSError * _Nonnull error, NSDictionary * _Nonnull response) {
                          
                             wself.spaceRatioModel =[GTSpaceRatioModel modelWithDictionary:response[@"data"][@"bcoin_exchange_long_short_info"]];
                            if (!error) {
                                 [wself.spaceRatioModels removeAllObjects];
                                                          [wself.spaceRatioModels addObject: self.spaceRatioModel.BTC];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.EOS];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.BSV];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.XBT];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.LTC];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.XRP];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.ETH];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.ETC];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.BCH];
                                                           [wself.spaceRatioModels addObject: self.spaceRatioModel.TRX];
                            }
                           
                           
                               [wself.categoryView reloadData];
                                 [wself.tableView reloadData];
                                              
                                         [wself.tableView endRefreshing];
                       }];
             }else{
                  [self.bcoin_coin_long_short_infos removeAllObjects];
                 [GateRequestManager get:v_coin_typeURL(self.type) block:^(NSError * _Nonnull error, NSDictionary * _Nonnull response) {
                    
                             wself.coinSpaceRatioModel =[GTCoinSpaceRatioModel modelWithDictionary:response[@"data"]];
                   
                            if (!error) {
                                
               
                [self.bcoin_coin_long_short_infos addObject: wself.coinSpaceRatioModel.bcoin_coin_long_short_info.Huobi_quarter];
                [self.bcoin_coin_long_short_infos addObject: wself.coinSpaceRatioModel.bcoin_coin_long_short_info.Okex_quarter];
                [self.bcoin_coin_long_short_infos addObject: wself.coinSpaceRatioModel.bcoin_coin_long_short_info.Okex_swap];
                            
                            }
                                                      
                                 [wself.tableView reloadData];
                                              
                                         [wself.tableView endRefreshing];
                       }];
             }
                
         }];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [wself.tableView startRefreshing];
      });
   
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
-(void)creatTopSelectView{
      self.topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];
     [self.view addSubview:self.topSelectView];
//     self.tableView.frame = CGRectMake(0,CGRectGetMaxY(self.topSelectView.frame) , scrWeiht, self.view.bounds.size.height-CGRectGetMaxY(self.topSelectView.frame));
     self.tableView.backgroundColor = [UIColor whiteColor];
    [self registerCreateTable];
    @weakify(self)
    self.topSelectView.selectBlock = ^(NSInteger index, NSString * _Nonnull title) {
         @strongify(self)
        self.type = title;
          [self.tableView startRefreshing];
        
        
   
               
    };
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

   
    if (self.topSelectView.categoryView.selectedIndex == 0) {
      NSArray * arr = self.spaceRatioModels[section];
        GTSpaceRatioSubvModel * spaceRatioSubvModel = arr.firstObject;
                  GateHearView  * hearView  = [GateHearView getGateHearView];
                hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
                  
                 hearView.nameLb.text = spaceRatioSubvModel.coin_type;
                 
                    return hearView;
    }else{
        if (section == 0) {
        

            GateHearView  * hearView  = [GateHearView getGateHearView];
             hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
            
             if (section == 0) {
                 hearView.nameLb.text = self.type;
             }else{
                
             }
              return hearView;
          }else{
               GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                selectCategoryView.categoryView.defaultSelectedIndex = self.selectIndex;
                                               selectCategoryView.titles =  @[@"1天内",@"1周内"];
                                           
                                               selectCategoryView.selectblock = ^(NSInteger index) {
                                                   
                                                   [GateRequestManager get:v_coin_type_v_tsURL(self.type,@"5m") block:^(NSError * _Nonnull error, NSDictionary * _Nonnull response) {
                                                       self.spaceRatioModel =[GTSpaceRatioModel modelWithDictionary:response[@"data"]];
                                                                                                                           if (!error) {
                                                                                                                          
                                                                                                                           }
                                                                                                         self.selectIndex = index;
                                                                                                                          
                                                                                                                              [self.categoryView reloadData];
                                                                                                                                [self.tableView reloadData];
                                                                                                                                             
                                                                                                                                        [self.tableView endRefreshing];
                                                   }];
                                                   
                                                   
                                                   
                                                   
                                                   
                                               };
//              if (self.bcoin_coin_long_short_infos.count>=section-1) {
//                   NSArray * arr = self.bcoin_coin_long_short_infos[section-1];
//                               bcoin_coin_long_short_infoModel *coin_long_short_infoModel =  arr.firstObject;
//                                             
//                               selectCategoryView.title = [NSString stringWithFormat:@"%@永续%@多空",coin_long_short_infoModel.exchange_future_type,self.type];
//              }
             
         
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
 
    if (self.topSelectView.categoryView.selectedIndex == 0) {
        if (indexPath.row == 0) {
                            return 50;
            }
     return 120;
    }else{
      
        
         if (indexPath.section == 0) {
                if (indexPath.row == 0) {
                     return 50;
                }
                return 120;
            }else{
               
            CGFloat height = [tableView
                              fd_heightForCellWithIdentifier:@"GTDuoKongLineChartsTableViewCell"
                              cacheByIndexPath:indexPath
                              configuration:^(id cell) {
        //         cell.possArr = self.gateHomeModel.poss;
        //                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                               }];
            return height;
              
            }
    }
   
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     
     if (self.topSelectView.categoryView.selectedIndex == 0) {
         return self.spaceRatioModels.count;
     }else{
         return self.bcoin_coin_long_short_infos.count>0? self.bcoin_coin_long_short_infos.count+1:0;
     }
     
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (self.topSelectView.categoryView.selectedIndex == 0) {
       NSArray * arr = self.spaceRatioModels[section];
       return self.spaceRatioModels.count>0? arr.count+1:0;
       }else{
           if (section == 0) {
              return self.coinSpaceRatioModel.bcoin_exchange_long_short_info.count+1;
           }else{
               return  self.bcoin_coin_long_short_infos.count>0? 1:0;
           }
        
       }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    if (self.topSelectView.categoryView.selectedIndex == 0) {
        if (indexPath.row == 0) {
                             
                                   GTTopTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTTopTotalTableViewCell" forIndexPath:indexPath];
                                  cell.backgroundColor = [UIColor whiteColor];
                                  return cell;
                              }else{
                                  GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
                                  NSArray * arr = self.spaceRatioModels[indexPath.section];
                                  GTSpaceRatioSubvModel * spaceRatioSubvModel = arr[indexPath.row-1];
                                       cell.spaceRatioSubvModel = spaceRatioSubvModel;
                                         return cell;
                              }
    }else{
        if (indexPath.section == 0) {
                if (indexPath.row == 0) {
                      
                            GTTopTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTTopTotalTableViewCell" forIndexPath:indexPath];
                           cell.backgroundColor = [UIColor whiteColor];
                           return cell;
                       }else{
                           GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
                           GTSpaceRatioSubvModel * spaceRatioSubvModel  = self.coinSpaceRatioModel.bcoin_exchange_long_short_info[indexPath.row-1];
                         
                                cell.spaceRatioSubvModel = spaceRatioSubvModel;
                                  return cell;
                       }
            }else{
                 GTDuoKongLineChartsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GTDuoKongLineChartsTableViewCell" forIndexPath:indexPath];
                if (self.bcoin_coin_long_short_infos.count>indexPath.section-1) {
                     NSArray * arr = self.bcoin_coin_long_short_infos[indexPath.section-1];
                                         cell.bcoin_coin_long_short_infos = arr;
                }
              
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
