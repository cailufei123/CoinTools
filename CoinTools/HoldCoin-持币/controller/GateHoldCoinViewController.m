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
@interface GateHoldCoinViewController ()

@end

@implementation GateHoldCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"持币";
  GateTopSelectView * topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];
     
        [self.view addSubview:topSelectView];
    
//       self.tableView.frame = CGRectMake(0,kTopHeight, scrWeiht, self.view.bounds.size.height-0);
      
    
        gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
        gateTableRegisterNib(self.tableView, @"GateHoldCoinTopMessageCell");
        gateTableRegisterNib(self.tableView, @"GTHoldChartsStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GTHoldCoinListTableViewCell");
       GateRefreshNormalHeader * header = [GateRefreshNormalHeader headerWithRefreshingBlock:^{
           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [self.tableView.mj_header endRefreshing];
           });
       }];
     
        GateRefreshAutoNormalFooter *footer = [GateRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableView.mj_footer endRefreshing];
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            });
            
         }];
    self.tableView.backgroundColor = [UIColor whiteColor];
//       self.tableView.mj_footer = footer;
//       self.tableView.mj_header = header;
    self.tableView.mj_footer.hidden = YES;
//    [self setDate];
     __weak typeof(self) wself = self;
    [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
        
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wself.tableView endRefreshing];
            });
    }];
}
//- (void)pullToRefresh {
//    __weak UITableView *wtableView = self.tableView;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [wtableView pullDownDealFooterWithItemCount:self.dataArr.count cursor:@"11"];
//    });
//}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section == 2) {
         
          return 75.01;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        GTHoldCoinHeardView * coinHeardView = [GTHoldCoinHeardView loadHoldCoinHeardView];
           coinHeardView.frame = CGRectMake(0, 0, scrWeiht, 75);
            return coinHeardView;
      
    }
      return [UIView new];
   
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
           return 10;
       }
         return 1 ;
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGFloat height = [tableView
                          fd_heightForCellWithIdentifier:@"GateHoldCoinTopMessageCell"
                          cacheByIndexPath:indexPath
                          configuration:^(id cell) {

                           }];
        return height;
    }else if  (indexPath.section == 1){
        CGFloat height = [tableView
                          fd_heightForCellWithIdentifier:@"GTHoldChartsStatisticsTableViewCell"
                          cacheByIndexPath:indexPath
                          configuration:^(id cell) {

                           }];
        return height;
    }else if  (indexPath.section == 2){
          return 60;
        CGFloat height = [tableView
                          fd_heightForCellWithIdentifier:@"GTHoldCoinListTableViewCell"
                          cacheByIndexPath:indexPath
                          configuration:^(id cell) {

                           }];
        return height;
    }
    
   return 0;

}
  -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
     
      if (indexPath.section == 0) {
               GateHoldCoinTopMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHoldCoinTopMessageCell" forIndexPath:indexPath];
                                                          
                return cell;
          
         }else if  (indexPath.section == 1){
                GTHoldChartsStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldChartsStatisticsTableViewCell" forIndexPath:indexPath];
                                                           
             return cell;
             
         }else if  (indexPath.section == 2){
                GTHoldCoinListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldCoinListTableViewCell" forIndexPath:indexPath];
             cell.chibiLb.text = [NSString stringWithFormat:@"0%ld  %@",indexPath.row + 1,@"1.08%%"];
             return cell;
             
         }
         return nil;
  }
 

@end
