//
//  GateBurstViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstViewController.h"
#import "GateTopSelectView.h"
#import "GateHoursTableViewCell.h"
#import "GateBurstHouseTableViewCell.h"
#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
#import "GateHousBurstStatisticsTableViewCell.h"
#import "GateHoursSelectCategoryView.h"
#import "GateCoinBurstStatisticsTableViewCell.h"
#import "GateBurstListTableViewCell.h"

@interface GateBurstViewController ()
@property(nonatomic,strong)NSArray * littes;
@end

@implementation GateBurstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navTitle  =@"爆仓";
    GateTopSelectView * topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];
   
    [self.view addSubview:topSelectView];
//[UINib nibWithNibName:[NSString stringWithFormat:@"CoinTools.bundle/%@",] bundle:[NSBundle mainBundle]]
    gateTableRegisterNib(self.tableView, @"GateHoursTableViewCell");
      gateTableRegisterNib(self.tableView, @"GateBurstHouseTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateThirtyDaysBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterClass(self.tableView, @"GateCoinBurstStatisticsTableViewCell");
       gateTableRegisterNib(self.tableView, @"GateBurstListTableViewCell");
//     [topSelectView viewShadowPathWithColor:[UIColor grayColor] shadowOpacity:0.5 shadowRadius:6 shadowPathType:LeShadowPathBottom shadowPathWidth:8];
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.tableView.frame = CGRectMake(0,CGRectGetMaxY(topSelectView.frame) , scrWeiht, self.view.bounds.size.height-CGRectGetMaxY(topSelectView.frame));
    self.tableView.backgroundColor = [UIColor whiteColor];
    
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
//    self.tableView.mj_footer = footer;
//    self.tableView.mj_header = header;
    __weak typeof(self) wself = self;
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [wself.tableView endRefreshing];
               });
       }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    if (section == 3 || section == 4|| section == 5){
             return 60;
       }else {
           return 0.01;
       }
    

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    if (section == 3){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
            selectCategoryView.titles =  @[@"交易",@"类型",@"方向",@"价格",@"总额"];
        
            selectCategoryView.selectblock = ^(NSInteger index) {
                
            };
                return selectCategoryView;
    }else if (section == 4){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[@"交易",@"类型",@"方向",@"价格",@"总额"];
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
                       return selectCategoryView;
    }else if (section == 5){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[];
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
                       return selectCategoryView;
    }else {
            return [UIView new];
      }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
          return 1;
    }else if (section == 1) {
          return 3;
    }else if (section == 2){
         return 1;
   }else if (section == 3){
         return 10;
   }else if (section == 4){
         return 1;
   }else if (section == 5){
         return 20;
   }else {
         return 1;
   }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 0) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateHoursTableViewCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
                    //         cell.possArr = self.gateHomeModel.poss;
                    //                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                                           }];
                     return height;
       }else if (indexPath.section == 1) {
             return 50;
       }else if (indexPath.section == 2){
            CGFloat height = [tableView
                                                     fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                                     cacheByIndexPath:indexPath
                                                     configuration:^(id cell) {
                               //         cell.possArr = self.gateHomeModel.poss;
                               //                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                                                      }];
                                return height;
       }else if (indexPath.section == 3){
             return 50;
       }else if (indexPath.section == 4){
            CGFloat height = [tableView
                                                                 fd_heightForCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell"
                                                                 cacheByIndexPath:indexPath
                                                                 configuration:^(id cell) {
                
                GateCoinBurstStatisticsTableViewCell *cell1 = cell;
                cell1.arr = @[];
                                           //         cell.possArr = self.gateHomeModel.poss;
                                           //                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                                                                  }];
                                            return height;
       }else if (indexPath.section == 5){
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
        GateHoursTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHoursTableViewCell" forIndexPath:indexPath];
              return cell;
       }else  if (indexPath.section == 1) {
          GateBurstHouseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstHouseTableViewCell" forIndexPath:indexPath];
                                     
                              if (indexPath.row == 0) {
                                  cell.littes = self.littes;
                              }else{
                                   [cell cellWithTableView:tableView indexPath:indexPath setLittes:self.littes];
                              }
                       
                              return cell;
       }else  if (indexPath.section == 2)  {
          GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }else  if (indexPath.section == 3)  {
          GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }else  if (indexPath.section == 4)  {
          GateCoinBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }else  if (indexPath.section == 5)  {
          GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
                       return cell;
       }else  {
          GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}
@end
