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

@property(nonatomic,copy)NSString *v_pic_ts;
@property(nonatomic,copy)NSString *v_coin_type;
@property(nonatomic,assign)NSInteger v_pic_tsIndex;
@property(nonatomic,strong)GTBigOrderModel * bigOrderModel;

@end

@implementation GateBigOrderStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       
        self.view.backgroundColor = [UIColor whiteColor];

       
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        gateTableRegisterClass(self.tableView, @"GateWholeNetworkBigOrderStatisticsCell");
        gateTableRegisterNib(self.tableView, @"GateThirtyDaysBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateBigOrderDistributionDealCell");
        gateTableRegisterNib(self.tableView, @"GateBurstListTableViewCell");
    @weakify(self)
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
            @strongify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self loadDataDefult:NO];
              
             });
       }];

 self. v_pic_ts =  @"1d";
 self.v_coin_type =  @"BTC";
 [self loadDataDefult:YES];
}

-(void)loadDataDefult:(BOOL)isDefult{
    isDefult = YES;
    NSString * url = isDefult?bigdealURL:bigdeal_v_tsURL(self.v_coin_type, self.v_pic_ts);
    NSLog(@"%@",url);
    [GTStyleManager loadingImage];
    @weakify(self)
   
    [GateRequestManager getCache:url block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
   
        @strongify(self)
       
        if (!error) {
            self.bigOrderModel =[GTBigOrderModel modelWithDictionary:response[@"data"]];
            self.isError = NO;
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
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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
    if (section == 1) {
        return self.bigOrderModel.bigdeal_info_pic?1:0;
    }
    return 1 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 60;

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
                selectCategoryView.titles =  @[@"1H",@"4H",@"24"];
    selectCategoryView.titleLb.text =getItemModel(self.bigOrderModel.bigdeal_bigtitle.alldatalist.firstObject.datalist.firstObject)[section].content;
    setStyle(getItemModel(self.bigOrderModel.bigdeal_bigtitle.alldatalist.firstObject.datalist.firstObject)[section], selectCategoryView.titleLb)
 
                selectCategoryView.selectblock = ^(NSInteger index) {
                    
                };
                    return selectCategoryView;
//    if (section == 0) {
//         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
//               selectCategoryView.titles =  @[];
//           selectCategoryView.title = @"大单成交统计";
//               selectCategoryView.selectblock = ^(NSInteger index) {
//
//               };
//                   return selectCategoryView;
//    }else  if (section == 1){
//        GateThirtyDaysBigOrderStatisticsSelectView *thirtyDaysBigOrderStatisticsSelectView = [[GateThirtyDaysBigOrderStatisticsSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 50)];
//         @weakify(self)
//        thirtyDaysBigOrderStatisticsSelectView.selectblock = ^(NSInteger index) {
//           @strongify(self)
//
//        };
//        return thirtyDaysBigOrderStatisticsSelectView;
//    }else  if (section == 2){
//         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
//                     selectCategoryView.titles =  @[@"5M",@"1H",@"4H",@"1D"];
//
//                     selectCategoryView.selectblock = ^(NSInteger index) {
//
//                     };
//                         return selectCategoryView;
//    }else  if (section == 3){
//         GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
//                     selectCategoryView.titles =  @[@"1H",@"4H",@"24"];
//
//                     selectCategoryView.selectblock = ^(NSInteger index) {
//
//                     };
//                         return selectCategoryView;
//    }else{
//       return  [UIView new];
//    }

   
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
        cell.bigOrderModel = self.bigOrderModel;
              return cell;
       }else if (indexPath.section == 1) {
              GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
           cell.burstcalpic = self.bigOrderModel.bigdeal_info_pic;
                    return cell;
            }else if (indexPath.section == 2) {
               GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
                cell.indexPath = indexPath;
                cell.burstbourse = self.bigOrderModel.bigdeal_total;
                                    return cell;
            }else if (indexPath.section == 3) {
               GateBigOrderDistributionDealCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBigOrderDistributionDealCell" forIndexPath:indexPath];
                cell.bigOrderModel = self.bigOrderModel;
                                    return cell;
            }
//            else  if (indexPath.section == 4)  {
//               GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
//                            return cell;
//            }
            else  {
          GateWholeNetworkBigOrderStatisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateWholeNetworkBigOrderStatisticsCell" forIndexPath:indexPath];
                       return cell;
       }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}
@end
