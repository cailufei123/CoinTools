//
//  ViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/25.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "ViewController.h"
#import "GateHomePageController.h"
#import "GatettttViewController.h"
#import "GateBigOrderStatisticsViewController.h"
//#import "GateTestViewController.h"
//#import "GateWebTestViewController.h"
#import "GateWholeNetworkPositionStatisticsViewController.h"
#import "GateBigOrderStatisticsViewController.h"
#import "GateWholeNetworkPositionStatisticsViewController.h"
#import "GateNewDetailsViewController.h"
#import "GateMarketValueViewController.h"
#import "GateBurstViewController.h"

#import "GateHomePageTopEnterViewCell.h"
#import "GateFearIndexTableViewCell.h"
#import "GateHoldCoinViewController.h"
@interface GateHomePageController ()
@property(nonatomic,strong)NSArray * classArry;
@end

@implementation GateHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.classArry = [NSArray arrayWithObjects:@"GateBurstViewController",@"GateNewDetailsViewController",@"GateBigOrderStatisticsViewController",@"GateWholeNetworkPositionStatisticsViewController",@"GateHoldCoinViewController" ,nil];
    self.tableView.frame = CGRectMake(0,88 , scrWeiht, scrHeiht);
     self.tableView.backgroundColor = [UIColor whiteColor];
    gateTableRegisterClass(self.tableView, @"UITableViewCell");
    gateTableRegisterClass(self.tableView, @"GateHomePageTopEnterViewCell");
    gateTableRegisterNib(self.tableView, @"GateFearIndexTableViewCell");

    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
    [imag addSubview:[UIImageView wh_imageViewWithPNGImage:@"CoinTools.framework/GateScources.bundle/icon_logon_d_logo_145x51_@2x" frame:imag.frame]];
  self.navigationItem.titleView  = imag;
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 if (indexPath.section == 1){
     return 150;
}
  return 230;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
         GateHomePageTopEnterViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHomePageTopEnterViewCell" forIndexPath:indexPath];
        @weakify(self)
        cell.selectBlock = ^(NSInteger index) {
            @strongify(self)
            
            [self.navigationController pushViewController:[self stringChangeToClass:self.classArry[index]] animated:YES];
        };
           return cell;
        
    }else if (indexPath.section == 1){
        GateFearIndexTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateFearIndexTableViewCell" forIndexPath:indexPath];
                 return cell;
    }
    
    return nil;
   
}

- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

@end
