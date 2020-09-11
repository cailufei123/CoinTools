//
//  GateDetailsViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/28.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateDetailsViewController.h"
#import "pressView.h"
#import "GatePrgessTableViewCell.h"
#import "GateHearView.h"
#import "GateData1TableViewCell.h"
#import "GateData2TableViewCell.h"
#import "GateLineChartTableViewCell.h"
#import "GateHomeModel.h"
#import "GateHearCategoryView.h"
#import "GateHearCategoryView.h"
#import "GateBurstViewController.h"
@interface GateDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)pressView *press;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic,strong)GateHomeModel *gateHomeModel;

@end

@implementation GateDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self createTable];
    [self loadData];
   

}

- (UIView *)listView {
  
    return self.view;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
    
   
}
-(void)loadData{
    [GateRequestManager post:homeURL params:@{@"v_coin_type":self.type} success:^(id  _Nonnull response) {
        self.gateHomeModel =[GateHomeModel modelWithDictionary:response[@"data"]];
        [self.tableView reloadData];
    } failure:^(NSError * _Nonnull failure) {

    }];
   
    [GateRequestManager get:homeURL block:^(NSError * _Nonnull error, NSDictionary * _Nonnull response) {
        NSLog(@"%@", response);
        
//        NSDictionary * dic =   @{
//            @"poss":
//            @[
//
//
//            @{@"line":@[@[@"2:00",@"344566343"],@[@"2:00",@"344566343"],@[@"2:00",@"34466343"],@[@"2:00",@"144566343"],@[@"2:00",@"44566343"],@[@"2:00",@"34566343"]]},
//
//             @{@"line":@[@[@"2:00",@"34456634"],@[@"2:00",@"3445663430"],@[@"2:00",@"344606343"],@[@"2:00",@"14456634"],@[@"2:00",@"54566343"],@[@"2:00",@"14566343"]]}
//
//
//            ]
//
//        };
//         self.gateHomeModel =[GateHomeModel modelWithDictionary:response];
//                [self.tableView reloadData];
       
    }];
    
//    
//          GateHearCategoryView  * hearView  = [GateHearCategoryView loadHearCategoryView];
//                        hearView.frame = CGRectMake(0, 0, scrWeiht, 150);
//                       
//          
//   
//    [self.view addSubview:hearView];
    
   
}



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self createTable];
    }
    return _tableView;
}
-(void)createTable{
       gateTableRegisterNib(self.tableView, @"GatePrgessTableViewCell");
      gateTableRegisterNib(self.tableView, @"GateData1TableViewCell");
      gateTableRegisterNib(self.tableView, @"GateData2TableViewCell");
      gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
      gateTableRegisterNib(self.tableView, @"GateBurstTableViewCell");
   
    self.tableView.dataSource = self;
     self.tableView.delegate = self;
    self.tableView.backgroundColor = UIColor.whiteColor;
//       self.tableView.showsVerticalScrollIndicator = NO;
//     if (@available(iOS 11.0, *)) {
//          self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//      }else {
//          self.automaticallyAdjustsScrollViewInsets = NO;
//      }
     [self.view addSubview:self.tableView];
   
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        GateHearCategoryView  * hearView  =  [[GateHearCategoryView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht, 50)];
        hearView.selectblock = ^(NSInteger index) {
            GateLineChartTableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
            
            if (index == 0) {
                  cell.possArr = self.gateHomeModel.poss;
            }else{
                  cell.possArr = self.gateHomeModel.diff;
            }
        };
        return hearView;
    }else{
       
        GateHearView  * hearView  = [GateHearView getGateHearView];
         hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
        
         if (section == 0) {
             hearView.nameLb.text = @"BTC";
         }
          return hearView;
    }
    
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{

      return 50;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 120;
    }else if (indexPath.section == 1){
         return 150;
    }else if (indexPath.section ==2){
         return 50;
    }else{
       
    CGFloat height = [tableView
                      fd_heightForCellWithIdentifier:@"GateLineChartTableViewCell"
                      cacheByIndexPath:indexPath
                      configuration:^(id cell) {
//         cell.possArr = self.gateHomeModel.poss;
//                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                       }];
    return height;
      
    }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
//         return 1;
        return self.gateHomeModel.long_short.count;
       }else if (section == 1){
            return 1;
       }else if (section == 2){
//            return 1;
          return self.gateHomeModel.burst_dtl.count;
       }else {
           return 1;
       }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
      GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
       cell.long_shortModel = self.gateHomeModel.long_short[indexPath.row];
        return cell;
   }else if (indexPath.section == 1) {
      GateData1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateData1TableViewCell" forIndexPath:indexPath];
       cell.h_burst_amtModel = self.gateHomeModel.burst_amt;
          return cell;
   }else if (indexPath.section == 2){
       GateData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateData2TableViewCell" forIndexPath:indexPath];
       cell.burst_dtl = self.gateHomeModel.burst_dtl[indexPath.row];
                return cell;
   }else {
       GateLineChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateLineChartTableViewCell" forIndexPath:indexPath];
       cell.possArr = self.gateHomeModel.poss;
                return cell;
   }
   
}



@end
