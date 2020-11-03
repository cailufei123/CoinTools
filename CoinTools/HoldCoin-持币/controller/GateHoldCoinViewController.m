//
//  GateHoldCoinViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/7.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHoldCoinViewController.h"
#import "GateHoldCoinTopMessageCell.h"
#import "GTHoldChartsStatisticsTableViewCell.h"
#import "GateTopSelectView.h"
#import "GTHoldCoinHeardView.h"
#import "GTHoldCoinListTableViewCell.h"
#import "LNRefresh.h"
#import "GTHoldCoinPieChartViewTableViewCell.h"
#import "GateHoursSelectCategoryView.h"

@interface GateHoldCoinViewController ()

@property(nonatomic,strong)GTHoldCoinModel * holdCoinModel;
@property (nonatomic, copy) NSString * v_coin_type;
@end

@implementation GateHoldCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"持币";

    
        gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
        gateTableRegisterNib(self.tableView, @"GateHoldCoinTopMessageCell");
        gateTableRegisterNib(self.tableView, @"GTHoldChartsStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GTHoldCoinListTableViewCell");
    gateTableRegisterNib(self.tableView, @"GTHoldCoinPieChartViewTableViewCell");
    
    
   
       @weakify(self)
          [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
               @strongify(self)
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [self loadDataWhit:1];
                  });
          }];
    self.v_coin_type = @"BTC";
    [GTStyleManager loadingImage];
    [self loadDataWhit:0];
    self.titles = @[@"BTC", @"ETH", @"XRP", @"BCH"];
    
}



-(void)loadDataWhit:(NSInteger)index{
    @weakify(self)
    NSString * url = nil;
    if (index == 0) {
        url = cashURL;
    }else if(index == 1){
        url = cash_v_coin_typeURL(self.v_coin_type);
    }
    
          
     [GateRequestManager getCache:url block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.holdCoinModel = [GTHoldCoinModel modelWithDictionary:response[@"data"]];
           
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
    [self.tableView startRefreshing];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
//    if (section == 3) {
//
//          return 75.01;
//    }
    if (section == 0||section == 1||section == 2) {
         
          return 60;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (self.holdCoinModel) {
        if (section == 0){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[];
                  selectCategoryView.title = getItemModel(self.holdCoinModel.holdpage_bigtitle.alldatalist.firstObject.datalist.firstObject).firstObject.content;
            setStyle(getItemModel(self.holdCoinModel.holdpage_bigtitle.alldatalist.firstObject.datalist.firstObject).firstObject, selectCategoryView.titleLb);
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
                       return selectCategoryView;
        }else{
            GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                       selectCategoryView.titles =  @[];
            selectCategoryView.title = getItemModel(self.holdCoinModel.holdpage_bigtitle.alldatalist.firstObject.datalist.firstObject)[section].content;
            setStyle(getItemModel(self.holdCoinModel.holdpage_bigtitle.alldatalist.firstObject.datalist.firstObject)[section], selectCategoryView.titleLb);
                       selectCategoryView.selectblock = ^(NSInteger index) {
                           
                       };
                           return selectCategoryView;
        }
    }else{
       
    }
    return  [UIView new];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.holdCoinModel.hoardpage_top5?1:0;
    }
    if (section == 1) {
     
    if (self.holdCoinModel.hoardpage_trans.alldatalist.firstObject.datalist.firstObject.count<=0) {
        return 0;
    }
    return self.holdCoinModel.hoardpage_trans.alldatalist.firstObject.datalist.firstObject.count>5? 5 + 1:self.holdCoinModel.hoardpage_trans.alldatalist.firstObject.datalist.firstObject.count+1;
   }
    
    if (section == 2) {
       
        return self.holdCoinModel.hoardpage_top100.alldatalist.firstObject.datalist.firstObject.count>0? self.holdCoinModel.hoardpage_top100.alldatalist.firstObject.datalist.firstObject.count+1:0;
       }
    
    return self.holdCoinModel.hoardpage_top5?1:0;
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return (scrWeiht - 150);
        CGFloat height = [tableView
                          fd_heightForCellWithIdentifier:@"GateHoldCoinTopMessageCell"
                          cacheByIndexPath:indexPath
                          configuration:^(id cell) {

                           }];
        return height;
    }else if  (indexPath.section == 4){
        CGFloat height = [tableView
                          fd_heightForCellWithIdentifier:@"GTHoldChartsStatisticsTableViewCell"
                          cacheByIndexPath:indexPath
                          configuration:^(id cell) {

                           }];
        return height;
    }
//    else if  (indexPath.section == 2){
//        return (scrWeiht - 150);
//
//    }
    else if  (indexPath.section == 1|| indexPath.section == 2){
        if (indexPath.row == 0) {
            return 40;
        }else{
            return 60;
        }
        
       
    }
    
   return 0;

}
  -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
     
//      if (indexPath.section == 0) {
//               GateHoldCoinTopMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHoldCoinTopMessageCell" forIndexPath:indexPath];
//
//                return cell;
//
//         }else if  (indexPath.section == 1){
//                GTHoldChartsStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldChartsStatisticsTableViewCell" forIndexPath:indexPath];
//
//             return cell;
//
//         }else
             if  (indexPath.section == 0){
                GTHoldCoinPieChartViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldCoinPieChartViewTableViewCell" forIndexPath:indexPath];
                 cell.hoardpage_top5 = self.holdCoinModel.hoardpage_top5;
             return cell;
             
         }
         
         else if  (indexPath.section == 1||indexPath.section == 2){
                GTHoldCoinListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldCoinListTableViewCell" forIndexPath:indexPath];
           
             
             if (indexPath.section == 1) {
                 cell.tagIndex = 1;
                 cell.indexPath = indexPath;
                 cell. holdCoinModel = self.holdCoinModel.hoardpage_trans;
                 
             }
             if (indexPath.section == 2) {
                 cell.tagIndex = 2;
                 cell.indexPath = indexPath;
                 cell. holdCoinModel = self.holdCoinModel.hoardpage_top100;
             }
         
         
             return cell;
             
         }
         return nil;
  }
 

@end
