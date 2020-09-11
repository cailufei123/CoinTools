//
//  GateHoldCoinViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/7.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHoldCoinViewController.h"
#import "GateHoldCoinTopMessageCell.h"
@interface GateHoldCoinViewController ()

@end

@implementation GateHoldCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"持币";
  
       self.tableView.frame = CGRectMake(0,0 , scrWeiht, self.view.bounds.size.height-0);
      
    
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
    gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
      gateTableRegisterNib(self.tableView, @"GateHoldCoinTopMessageCell");
  
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 60 ;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 80;

}
  -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
       GateHoldCoinTopMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHoldCoinTopMessageCell" forIndexPath:indexPath];
                                                 return cell;
     
  }
 

@end
