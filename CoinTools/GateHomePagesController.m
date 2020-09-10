//
//  ViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/25.
//  Copyright © 2020 MAC. All rights reserved.
//


#import "GateHomePagesController.h"

@interface GateHomePagesController ()
@property(nonatomic,strong)NSArray * classArry;
@end

@implementation GateHomePagesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.classArry = [NSArray arrayWithObjects:@"GateBurstViewController",@"GateNewDetailsViewController",@"GateBigOrderStatisticsViewController",@"GateWholeNetworkPositionStatisticsViewController",@"GateMarketValueViewController" ,nil];
    self.tableView.frame = CGRectMake(0,88 , scrWeiht, scrHeiht);
     self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = gateColor(@"ffffff");
    gateTableRegisterClass(self.tableView, @"UITableViewCell");
//    [self.tableView reloadData];
//    [self.navigationController pushViewController:[[GateWholeNetworkPositionStatisticsViewController alloc]init] animated:YES];
    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
//    imag.backgroundColor = [UIColor redColor];
    UIImageView *fff =  [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 250)];
    fff.image = [UIImage imageNamed:@"GateScources.bundle/icon_logon_d_logo_145x51_@2x"];
//    fff.image = [self imageNamed:@"2_23x33_@3x" ofBundle:@"GateScources.bundle"];
//     fff.image = [UIImage imageNamed:@"icon_logon_d_logo_145x51_@3x"];
//    [UIImage imageNamed:@"TestWork.framework/rrrrr.bundle/AppIcon_40x40_@2x"]
    fff.backgroundColor = [UIColor redColor];
    [imag addSubview:fff];
    NSString *file2 = [[NSBundle mainBundle] pathForResource:@"GateScources.bundle/icon_logon_d_logo_145x51_@2x" ofType:@"png"];
    UIImage *img2 = [UIImage imageWithContentsOfFile:file2];
   
//        UIImage *img2 = [UIImage imageWithContentsOfFile:file2];
    fff.image = img2;
  self.navigationItem.titleView  = imag;
    
    [self.view addSubview:fff];
}
- (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName {

    UIImage *image = nil;

    NSString *image_name = [NSString stringWithFormat:@"%@.png", name];

    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];

    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];

    NSString *image_path = [bundlePath stringByAppendingPathComponent:image_name];;

    image = [[UIImage alloc] initWithContentsOfFile:image_path];

    return image;

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
    
//    UIViewController * rr = [self stringChangeToClass:self.classArry[indexPath.row]];
//    GatettttViewController * nv = [[GatettttViewController alloc] initWithRootViewController: rr];
//    [self.navigationController pushViewController: [[GateBurstViewController alloc] init] animated:YES];
//     [self.navigationController pushViewController:rr animated:YES];
}
- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}

@end
