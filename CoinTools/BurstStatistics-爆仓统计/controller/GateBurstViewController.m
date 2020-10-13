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
#import "GTBurstModel.h"
#import "GTHeYueMessageTableViewCell.h"
@interface GateBurstViewController ()
@property(nonatomic,strong)NSArray * littes;
@property(nonatomic,strong)GTBurstModel * burstModel;
@end

@implementation GateBurstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navTitle  =@"爆仓";
//[UINib nibWithNibName:[NSString stringWithFormat:@"CoinTools.bundle/%@",] bundle:[NSBundle mainBundle]]
    gateTableRegisterNib(self.tableView, @"GateHoursTableViewCell");
      gateTableRegisterNib(self.tableView, @"GateBurstHouseTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateThirtyDaysBurstStatisticsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
     gateTableRegisterClass(self.tableView, @"GateCoinBurstStatisticsTableViewCell");
     gateTableRegisterClass(self.tableView, @"GTHeYueMessageTableViewCell");
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

    __weak typeof(self) wself = self;
    @weakify(self)
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
            @strongify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                NSDictionary * dict =  [GTCurrencyTool readLocalFileWithName:@"CoinTools.framework/burstData"];
                self.burstModel =[GTBurstModel  modelWithDictionary:dict[@"data"]];
                [self.tableView reloadData];
                
           [wself.tableView endRefreshing];
               });
       }];
      [wself.tableView startRefreshing];
}
-(void)selectitemOrindex:(NSInteger)index{
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
     return 60;
    

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    if (section == 3){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
        if (self.selectedIndex == 0) {
             selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
        }else{
            selectCategoryView.titles =  @[];
        }
           
        
            selectCategoryView.selectblock = ^(NSInteger index) {
                
            };
                return selectCategoryView;
    }else if (section == 4){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                 if (self.selectedIndex == 0) {
                        selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
                   }else{
                       selectCategoryView.titles =  @[];
                   }
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
       
                       return selectCategoryView;
    }else {
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[];
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
                       return selectCategoryView;
    }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.selectedIndex == 0) {
        return 6;
    }else{
        return 5;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
          return 1;
    }else if (section == 1) {
          return 3;
    }else if (section == 2){
        if (self.selectedIndex == 0) {
             return self.burstModel.bcoin_coin_30d_calendar_info.count>0?1:0;
        }else{
             return 1;
        }
      
       
   }else if (section == 3){
       if (self.selectedIndex == 0) {
                 return self.burstModel.bcoin_coin_burst_exchange_info.count>0?self.burstModel.bcoin_coin_burst_exchange_info.count:0;
             }else{
                  return 1;
             }
      
   }else if (section == 4){
        
       if (self.selectedIndex == 0) {
                       return 1;
                   }else{
                        return 20;
                   }
            
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
           
                                           }];
                     return height;
       }else if (indexPath.section == 1) {
             return 50;
       }else if (indexPath.section == 2){
           
           if (self.selectedIndex == 0) {
            CGFloat height = [tableView
                           fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                                                cacheByIndexPath:indexPath
                                                                configuration:^(id cell) {
                           GateThirtyDaysBurstStatisticsTableViewCell *cell1 = cell;
                           
                                         cell1.bcoin_coin_30d_calendar_infos =  self.burstModel.bcoin_coin_30d_calendar_info;
                                                                 }];
                                           return height;
           }else{
             return 150;
               
           }
           
       }else if (indexPath.section == 3){
            
           if (self.selectedIndex == 0) {
                return 50;
           
           }else{
             CGFloat height = [tableView
                                       fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                                                            cacheByIndexPath:indexPath
                                                                            configuration:^(id cell) {
                                       GateThirtyDaysBurstStatisticsTableViewCell *cell1 = cell;
                                       
                                                     cell1.bcoin_coin_30d_calendar_infos =  self.burstModel.bcoin_coin_30d_calendar_info;
                                                                             }];
                                                       return height;
               
           }
       }else if (indexPath.section == 4){
           
           
           if (self.selectedIndex == 0) {
                      CGFloat height = [tableView
                                                                                          fd_heightForCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell"
                                                                                          cacheByIndexPath:indexPath
                                                                                          configuration:^(id cell) {
                                         
                                         GateCoinBurstStatisticsTableViewCell *cell1 = cell;
                                         cell1.bcoin_coin_burst_total_info = self.burstModel.bcoin_coin_burst_total_info;
                                                                                           }];
                                                                     return height;
                     
                     }else{
                       return 50;
                         
                     }
       }else if (indexPath.section == 5){
            CGFloat height = [tableView
                                                                 fd_heightForCellWithIdentifier:@"GateBurstListTableViewCell"
                                                                 cacheByIndexPath:indexPath
                                                                 configuration:^(id cell) {
                GateBurstListTableViewCell*cell1 = cell;
                 cell1.bcoin_coin_burst_list_infoModel = self.burstModel.bcoin_coin_burst_list_info[indexPath.row];
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
           if (self.selectedIndex == 0) {
            GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                         cell.bcoin_coin_30d_calendar_infos =  self.burstModel.bcoin_coin_30d_calendar_info;
                                     return cell;
           }else{
               GTHeYueMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHeYueMessageTableViewCell" forIndexPath:indexPath];
                    
                                                   return cell;
               
           }
         
       }else  if (indexPath.section == 3)  {
           if (self.selectedIndex == 0) {
                      GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
                                cell.bcoin_coin_burst_exchange_infoModel = self.burstModel.bcoin_coin_burst_exchange_info[indexPath.row];
                                            return cell;
                     }else{
                    GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                                                cell.bcoin_coin_30d_calendar_infos =  self.burstModel.bcoin_coin_30d_calendar_info;
                                                            return cell;
                     }
         
       }else  if (indexPath.section == 4)  {
        
           if (self.selectedIndex == 0) {
             GateCoinBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell" forIndexPath:indexPath];
                      cell.bcoin_coin_burst_total_info = self.burstModel.bcoin_coin_burst_total_info;
                                  return cell;
            }else{
           GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
                     cell.bcoin_coin_burst_list_infoModel = self.burstModel.bcoin_coin_burst_list_info[indexPath.row];
                                 return cell;
            }
       }else  if (indexPath.section == 5)  {
          GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
           cell.bcoin_coin_burst_list_infoModel = self.burstModel.bcoin_coin_burst_list_info[indexPath.row];
                       return cell;
       }else  {
          GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }
   
}

@end
