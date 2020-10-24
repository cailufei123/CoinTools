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
//- (void)pullToRefresh {
//    __weak UITableView *wtableView = self.tableView;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [wtableView pullDownDealFooterWithItemCount:self.dataArr.count cursor:@"11"];
//    });
//}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
//    if (section == 3) {
//
//          return 75.01;
//    }
    if (section == 0) {
         
          return 60;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    if (section == 3) {
//        GTHoldCoinHeardView * coinHeardView = [GTHoldCoinHeardView loadHoldCoinHeardView];
//           coinHeardView.frame = CGRectMake(0, 0, scrWeiht, 75);
//            return coinHeardView;
//
//    }else
        if (section == 0){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[];
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                   };
                       return selectCategoryView;
    }
   
      return [UIView new];
   
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
           return 1;
       }
         return self.holdCoinModel.hoardpage_top100.alldatalist.firstObject.datalist.firstObject.count +1;
   
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
    else if  (indexPath.section == 2){
        return (scrWeiht - 150);
       
    }else if  (indexPath.section == 1){
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
         
         else if  (indexPath.section == 1){
                GTHoldCoinListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHoldCoinListTableViewCell" forIndexPath:indexPath];
             GTHomeTitleModel * model0 = getItemModel(self.holdCoinModel.hoardpage_top100.alldatalist[0].datalist.firstObject)[indexPath.row-1];
            GTHomeTitleModel * model1 = getItemModel(self.holdCoinModel.hoardpage_top100.alldatalist[1].datalist.firstObject)[indexPath.row-1];
             GTHomeTitleModel * model2 = getItemModel(self.holdCoinModel.hoardpage_top100.alldatalist[2].datalist.firstObject)[indexPath.row-1];
             GTHomeTitleModel * model3 = getItemModel(self.holdCoinModel.hoardpage_top100.alldatalist[3].datalist.firstObject)[indexPath.row-1];
             GTHomeTitleModel * titleMode0 = self.holdCoinModel.hoardpage_top100.alldatalist[0].title;
             GTHomeTitleModel * titleModel1 = self.holdCoinModel.hoardpage_top100.alldatalist[1].title;
             GTHomeTitleModel * titleModel2 = self.holdCoinModel.hoardpage_top100.alldatalist[2].title;
             GTHomeTitleModel * titleModel3 = self.holdCoinModel.hoardpage_top100.alldatalist[3].title;
             
             if (indexPath.row == 0) {
                 cell.chibiLb.text = [NSString stringWithFormat:@"%@",titleMode0.content];
                 cell.chicangLb.text = [NSString stringWithFormat:@"%@",titleModel1.content];
                 cell.day7.text = [NSString stringWithFormat:@"%@",titleModel2.content];
                 cell.chackBt.text = [NSString stringWithFormat:@"%@",titleModel3.content];
                 setStyle(titleMode0, cell.chibiLb);
                 setStyle(titleModel1, cell.chicangLb);
                 setStyle(titleModel2, cell.day7);
                 setStyle(titleModel3, cell.chackBt);
             }else{
                 cell.chibiLb.text = [NSString stringWithFormat:@"%@",model0.content];
                 cell.chicangLb.text = [NSString stringWithFormat:@"%@",model1.content];
                 cell.day7.text = [NSString stringWithFormat:@"%0.2lf",[model2.content doubleValue]];
                 cell.chackBt.text = [NSString stringWithFormat:@"%@",model3.content];
                 setStyle(model0, cell.chackBt);
                 setStyle(model1, cell.chackBt);
                 setStyle(model2, cell.chackBt);
                 setStyle(model3, cell.chackBt);
             }
             cell.chackBt.textColor = gateColor(@"2c63d3");
             cell.didPresentBlock = ^(NSString * _Nonnull str) {
             
                 
                 
                     EasyAlertView *alertView = [EasyAlertView alertViewWithTitle:@"地址" subtitle: cell.chicangLb.text AlertViewType:AlertViewTypeSystemAlert config:nil];
                 
                     [alertView addAlertItem:^EasyAlertItem *{
                         return [EasyAlertItem itemWithTitle:@"复制" type:AlertItemTypeSystemDefault callback:^(EasyAlertView *showview, long index) {
                             UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                             pasteboard.string = cell.chicangLb.text;
                             [EasyTextView showText:@"复制成功" config:^EasyTextConfig *{
                                 //（这三种方法都是一样的，根据使用习惯选择一种就行。|| 不传的参数就会使用EasyTextGlobalConfig全局配置的属性）
                                 //方法一
                                 //return [EasyTextConfig configWithSuperView:self.view superReceiveEvent:ShowTextEventUndefine animationType:TextAnimationTypeNone textStatusType:TextStatusTypeBottom];
                                 //方法二
                                 //return [EasyTextConfig shared].setBgColor([UIColor lightGrayColor]).setShadowColor([UIColor clearColor]).setStatusType(TextStatusTypeBottom);
                                 //方法三
                                 EasyTextConfig *config = [EasyTextConfig shared];
                                 config.bgColor = [UIColor blackColor] ;
                                 config.shadowColor = [UIColor clearColor] ;
                                 config.animationType = TextAnimationTypeFade;
                                 config.statusType = TextStatusTypeMidden ;
                                 return config ;
                             }];
                         }];
                     }];
               
                     [alertView addAlertItem:^EasyAlertItem *{
                         return [EasyAlertItem itemWithTitle:@"取消" type:AlertItemTypeSystemCancel callback:nil];
                     }];
                     [alertView showAlertView];
             };
             return cell;
             
         }
         return nil;
  }
 

@end
