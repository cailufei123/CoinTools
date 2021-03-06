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

@property(nonatomic,strong)NSMutableArray * lineDatas;
@end
@implementation GateWholeNetworkPositionStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"大单成交统计";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationItem.titleView = ;
   
    GateTopSelectView * topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];
    
       [self.view addSubview:topSelectView];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
//       self.tableView.frame = CGRectMake(0,CGRectGetMaxY(topSelectView.frame) , scrWeiht, self.view.bounds.size.height-CGRectGetMaxY(topSelectView.frame));
       self.tableView.backgroundColor = [UIColor whiteColor];
    
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
    
    
    gateTableRegisterNib(self.tableView, @"GateDeliveryPositionAmountCell");
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
       self.tableView.mj_footer = footer;
       self.tableView.mj_header = header;
    self.tableView.mj_footer.hidden = YES;
    [self setDate];
}
-(void)setDate{
    self.lineDatas = [NSMutableArray array];
    
    GateDiffLineModel * lineModel = [[GateDiffLineModel alloc] init];
    lineModel.line = [NSArray arrayWithObjects:@[@"哈哈哈",@"2"],@[@"2",@"10"],@[@"3",@"120"], nil];
    lineModel.name = @"hah"; lineModel.titleText =  @"hah";
    
    GateDiffLineModel * lineModel2 = [[GateDiffLineModel alloc] init];
       lineModel2.line = [NSArray arrayWithObjects:@[@"哈哈哈",@"20"],@[@"2",@"30"],@[@"3",@"30"], nil];
       lineModel2.name = @"hah"; lineModel2.titleText =  @"hah";
    [self.lineDatas addObject:lineModel];
      [self.lineDatas addObject:lineModel2];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)  return 5;
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
