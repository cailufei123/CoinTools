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
@interface GateHomePageController ()
@property(nonatomic,strong)NSArray * classArry;
@end

@implementation GateHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.classArry = [NSArray arrayWithObjects:@"GateBurstViewController",@"GateNewDetailsViewController",@"GateBigOrderStatisticsViewController",@"GateWholeNetworkPositionStatisticsViewController",@"GateMarketValueViewController" ,nil];
    self.tableView.frame = CGRectMake(0,88 , scrWeiht, scrHeiht);
     self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = gateColor(@"000000");
    gateTableRegisterClass(self.tableView, @"UITableViewCell");
//    [self.tableView reloadData];
//    [self.navigationController pushViewController:[[GateWholeNetworkPositionStatisticsViewController alloc]init] animated:YES];
    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
    [imag addSubview:[UIImageView wh_imageViewWithPNGImage:@"CoinTools.framework/GateScources.bundle/icon_logon_d_logo_145x51_@2x" frame:imag.frame]];
  self.navigationItem.titleView  = imag;
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
      return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.classArry.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    return 61;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.classArry[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
  
                         return cell;
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController * rr = [self stringChangeToClass:self.classArry[indexPath.row]];
//    GatettttViewController * nv = [[GatettttViewController alloc] initWithRootViewController: rr];
//    [self.navigationController pushViewController: [[GateBurstViewController alloc] init] animated:YES];
     [self.navigationController pushViewController:rr animated:YES];
}
- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

@end
