//
//  GateBigOrderStatisticsViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBigOrderStatisticsViewController.h"
#import "GateTopSelectView.h"
#import "GateHoursSelectCategoryView.h"
#import "GateWholeNetworkBigOrderStatisticsCell.h"
#import "GateThirtyDaysBigOrderStatisticsSelectView.h"
#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
#import "GateHousBurstStatisticsTableViewCell.h"
#import "GateBigOrderDistributionDealCell.h"
#import "GateBurstListTableViewCell.h"

@interface GateBigOrderStatisticsViewController ()
@property(nonatomic,strong)NSArray * littes;
@end

@implementation GateBigOrderStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navTitle  =@"大单成交统计";
        self.view.backgroundColor = [UIColor whiteColor];

        GateTopSelectView * topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];

        [self.view addSubview:topSelectView];
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        self.tableView.frame = CGRectMake(0,CGRectGetMaxY(topSelectView.frame) , scrWeiht, self.view.bounds.size.height-CGRectGetMaxY(topSelectView.frame));
        gateTableRegisterClass(self.tableView, @"GateWholeNetworkBigOrderStatisticsCell");
        gateTableRegisterNib(self.tableView, @"GateThirtyDaysBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateBigOrderDistributionDealCell");
        gateTableRegisterNib(self.tableView, @"GateBurstListTableViewCell");
        self.littes = @[@"交易",@"类型",@"方向",@"价格",@"总额"];
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
//       self.tableView.mj_footer = footer;
//       self.tableView.mj_header = header;
    self.tableView.mj_footer.hidden = YES;
    __weak typeof(self) wself = self;
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [wself.tableView endRefreshing];
               });
       }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 5;
    }
    if (section == 3) {
           return 1;
       }
    if (section == 4) {
        return 10;
    }
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
           selectCategoryView.title = @"大单成交统计";
               selectCategoryView.selectblock = ^(NSInteger index) {
                   
               };
                   return selectCategoryView;
    }else  if (section == 1){
        GateThirtyDaysBigOrderStatisticsSelectView *thirtyDaysBigOrderStatisticsSelectView = [[GateThirtyDaysBigOrderStatisticsSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 50)];
         @weakify(self)
        thirtyDaysBigOrderStatisticsSelectView.selectblock = ^(NSInteger index) {
           @strongify(self)
         
        };
        return thirtyDaysBigOrderStatisticsSelectView;
    }else  if (section == 2){
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
                     selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
                 
                     selectCategoryView.selectblock = ^(NSInteger index) {
                         
                     };
                         return selectCategoryView;
    }else  if (section == 3){
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
                     selectCategoryView.titles =  @[@"5M",@"1H",@"4H"];
                 
                     selectCategoryView.selectblock = ^(NSInteger index) {
                         
                     };
                         return selectCategoryView;
    }else  if (section == 4){
         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
                     selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
                 
                     selectCategoryView.selectblock = ^(NSInteger index) {
                         
                     };
                         return selectCategoryView;
    }
    
       else{
       return  [UIView new];
    }

   
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateWholeNetworkBigOrderStatisticsCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
                 GateWholeNetworkBigOrderStatisticsCell *cell1 = cell;
                 cell1.arr = @[];
                                        }];
                     return height;
       }else if (indexPath.section == 1) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
              
                                        }];
                     return height;
       }else if (indexPath.section == 3) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateBigOrderDistributionDealCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
              
                                        }];
                     return height;
       }else if (indexPath.section == 4){
            CGFloat height = [tableView
                                                                 fd_heightForCellWithIdentifier:@"GateBurstListTableViewCell"
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
        GateWholeNetworkBigOrderStatisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateWholeNetworkBigOrderStatisticsCell" forIndexPath:indexPath];
              return cell;
       }else if (indexPath.section == 1) {
              GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                    return cell;
            }else if (indexPath.section == 2) {
               GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
                                    return cell;
            }else if (indexPath.section == 3) {
               GateBigOrderDistributionDealCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBigOrderDistributionDealCell" forIndexPath:indexPath];
                                    return cell;
            }else  if (indexPath.section == 4)  {
               GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
                            return cell;
            }else  {
          GateWholeNetworkBigOrderStatisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateWholeNetworkBigOrderStatisticsCell" forIndexPath:indexPath];
                       return cell;
       }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}
@end
