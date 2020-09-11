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
@interface GateHoldCoinViewController ()

@end

@implementation GateHoldCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"持币";
  
       self.tableView.frame = CGRectMake(0,kTopHeight, scrWeiht, self.view.bounds.size.height-0);
      
    
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
    gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
      gateTableRegisterNib(self.tableView, @"GateHoldCoinTopMessageCell");
    gateTableRegisterNib(self.tableView, @"GTHoldChartsStatisticsTableViewCell");
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
       self.tableView.mj_footer = footer;
       self.tableView.mj_header = header;
    self.tableView.mj_footer.hidden = YES;
//    [self setDate];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
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
             
         }
         return nil;
  }
 

@end
