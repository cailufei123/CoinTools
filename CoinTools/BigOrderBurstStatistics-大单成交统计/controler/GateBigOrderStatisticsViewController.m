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


@property(nonatomic,copy)NSString *v_coin_type;
@property(nonatomic,copy)NSString * v_ts;
@property(nonatomic,strong)GTBigOrderModel * bigOrderModel;
@property(nonatomic,assign)NSInteger v_pic_tsIndex;
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

 self. v_ts =  @"1h";
 self.v_coin_type =  @"BTC";
 [self loadDataDefult:YES];
}
-(void)v_pic_tsSelect:(NSInteger)index{
    self.v_pic_tsIndex = index;
    if (index == 0) {
        self.v_ts = @"1h";
    }else if(index == 1){
        self.v_ts = @"4h";
    }else if(index == 2){
        self.v_ts = @"24h";
    }
    [self loadDataDefult:NO];
   
}
-(void)loadDataDefult:(BOOL)isDefult{
    isDefult = NO;
    NSString * url = isDefult?bigdealURL:bigdeal_v_tsURL(self.v_coin_type, self.v_ts);
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
    self.v_coin_type = title;
    [self.tableView startRefreshing];
   
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return self.bigOrderModel.bigdeal_total.alldatalist.firstObject.datalist.firstObject.count>0?self.bigOrderModel.bigdeal_total.alldatalist.firstObject.datalist.firstObject.count:0;}

    if (section == 3) {
        if(self.bigOrderModel.bigdeal_dist_huobi||self.bigOrderModel.bigdeal_dist_okex||self.bigOrderModel.bigdeal_dist_bitmex||self.bigOrderModel.bigdeal_dist_binance) {
            return 1;
        }else return 0;}

    if (section == 1) {
        return self.bigOrderModel.bigdeal_info_pic?1:0;
    }
    return 1 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section == 2) {
        return self.bigOrderModel.bigdeal_total.alldatalist.firstObject.datalist.firstObject.count>0?60:0.01;}

    if (section == 3) {
        if(self.bigOrderModel.bigdeal_dist_huobi||self.bigOrderModel.bigdeal_dist_okex||self.bigOrderModel.bigdeal_dist_bitmex||self.bigOrderModel.bigdeal_dist_binance) {
            return 60;
        }else return 0.01;}

    if (section == 1) {
        return self.bigOrderModel.bigdeal_info_pic?60:0.01;
    }

    return 60;

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    if (section == 2) {
        return self.bigOrderModel.bigdeal_total.alldatalist.firstObject.datalist.firstObject.count>0?[self getHoursSelectCategoryView:section]:[UIView new];}

    if (section == 3) {
        if(self.bigOrderModel.bigdeal_dist_huobi||self.bigOrderModel.bigdeal_dist_okex||self.bigOrderModel.bigdeal_dist_bitmex||self.bigOrderModel.bigdeal_dist_binance) {
            return [self getHoursSelectCategoryView:section];
        }else return [UIView new];}

    if (section == 1) {
        return self.bigOrderModel.bigdeal_info_pic?[self getHoursSelectCategoryView:section]:[UIView new];
    }

    return [self getHoursSelectCategoryView:section];
    
   
}
-( GateHoursSelectCategoryView *)getHoursSelectCategoryView:(NSInteger)section{
    GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 60)];
                selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
    selectCategoryView.titleLb.text =getItemModel(self.bigOrderModel.bigdeal_bigtitle.alldatalist.firstObject.datalist.firstObject)[section].content;
    setStyle(getItemModel(self.bigOrderModel.bigdeal_bigtitle.alldatalist.firstObject.datalist.firstObject)[section], selectCategoryView.titleLb)
    selectCategoryView.categoryView.defaultSelectedIndex = self.v_pic_tsIndex;
                selectCategoryView.selectblock = ^(NSInteger index) {
                    [self v_pic_tsSelect:index];
                };
                    return selectCategoryView;
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
