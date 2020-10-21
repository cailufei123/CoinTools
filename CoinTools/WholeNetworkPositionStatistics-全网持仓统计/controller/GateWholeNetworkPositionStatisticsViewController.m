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
@property(nonatomic,strong)NSMutableArray * dataArrs;
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
  
    
    self.v_coin_type = @"BTC";
       @weakify(self)
          [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
               @strongify(self)
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [self loadDataWhit:self.index];
                  });
          }];
    self.index = 1;
    [GTStyleManager loadingImage];
    [self loadData:0];

}




-(NSMutableArray *)dataArrs{
    if (!_dataArrs) {
        _dataArrs = [NSMutableArray array];
    }
    return  _dataArrs;
}


-(void)loadDataWhit:(NSInteger)index{
    self.index = index;
    if (index == 0) {
        self.v_ts = @"5m";
    }else if (index == 1) {
        self.v_ts = @"1h";
    }else if (index == 2) {
        self.v_ts = @"4h";
    }
    else if (index == 3) {
        self.v_ts = @"1d";
    }
    [self loadData:1];
}
-(void)loadData:(NSInteger)index{
    @weakify(self)
    NSString * url = nil;
    if (index == 0) {
        url = chiCongURL;
    }else if(index == 1){
        url = chiCong_v_tsURL(self.v_coin_type,self.v_ts);
    }
    
          
     [GateRequestManager getCache:url block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
         [self.dataArrs removeAllObjects];
         if (!error) {
             self.isError = NO;
             self.holdModel = [GTHoldModel modelWithDictionary:response[@"data"]];
             if (self.holdModel.holdcontract_total) {
                 [self.dataArrs addObject:self.holdModel.holdcontract_total];
             }
             if (self.holdModel.okexPosition) {
                 [self.dataArrs addObject:self.holdModel.okexPosition];
             }
             if (self.holdModel.bitmexPosition) {
                 [self.dataArrs addObject:self.holdModel.bitmexPosition];
             }
             if (self.holdModel.huobiPosition) {
                 [self.dataArrs addObject:self.holdModel.huobiPosition];
             }
             if (self.holdModel.binancePosition) {
                 [self.dataArrs addObject:self.holdModel.binancePosition];
             }
             if (self.holdModel.bybitPosition) {
                 [self.dataArrs addObject:self.holdModel.bybitPosition];
             }
             if (self.holdModel.bitcokePosition) {
                 [self.dataArrs addObject:self.holdModel.bitcokePosition];
             }
           
            
         }else{
             self.isError = YES;
           
         }
       
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
       
                           
        
    }];
    
}
-(void)selectitemOrindex:(NSInteger)index string:(nonnull NSString *)title{
    self.v_coin_type = title;
//    [self.tableView endRefreshing];
    [self.tableView startRefreshing];
   
   
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.holdModel?self.dataArrs.count+1:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)  return   self.holdModel.holdcontract.alldatalist[1].datalist.firstObject.count;;
     return self.holdModel?1:0;;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    return !self.holdModel?0.01:60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!self.holdModel) {
        return [UIView new];
    }
   
   
    if (section == 0) {
        GTHomeTitleModel *  titleModel  = [GTDataManager getItemModelWhit:self.holdModel.holdbigtitle.alldatalist.firstObject.datalist.firstObject].firstObject;
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
               selectCategoryView.titles =  @[];
        selectCategoryView.categoryView.defaultSelectedIndex = self.index;
           selectCategoryView.title = titleModel.content;
               selectCategoryView.selectblock = ^(NSInteger index) {
                   
               };
                   return selectCategoryView;
    }else{
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
        selectCategoryView.categoryView.defaultSelectedIndex = self.index;
                    selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
        GTHomeTitleModel *  titleModel  = [GTDataManager getItemModelWhit:self.holdModel.holdbigtitle.alldatalist.firstObject.datalist.firstObject][section];
           selectCategoryView.title = titleModel.content;
                    selectCategoryView.selectblock = ^(NSInteger index) {
                        [GTStyleManager loadingImage];
                        [self loadDataWhit:index];
                    };
                        return selectCategoryView;
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
       }else {
           CGFloat height = [tableView
                                        fd_heightForCellWithIdentifier:@"GateDeliveryPositionAmountCell"
                                        cacheByIndexPath:indexPath
                                        configuration:^(id cell) {
            
                                      }];
                   return height;
      }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       
        GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
        cell.indexPath = indexPath;
        cell.burstbourse = self.holdModel.holdcontract;
                                           return cell;
       }else  {
                GateDeliveryPositionAmountCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateDeliveryPositionAmountCell" forIndexPath:indexPath];
           cell.holdData = self.dataArrs[indexPath.section-1];
                             return cell;
       }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}
@end
