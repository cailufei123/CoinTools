//
//  GateFaceOrientationLandStatisticsViewController.m
//  CoinTools
//
//  Created by MAC on 2020/11/3.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateFaceOrientationLandStatisticsViewController.h"
#import "AutoRotation.h"
#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
@interface GateFaceOrientationLandStatisticsViewController ()
@property(nonatomic,strong) GateThirtyDaysBurstStatisticsTableViewCell * burstStatisticsTableViewCell ;
@end

@implementation GateFaceOrientationLandStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    UISwitch * ss  = [[UISwitch alloc] init];
    ss.frame = CGRectMake(0, 0, 90, 90);
    [self.view addSubview:ss];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 100, 44);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//    [self ar_turnToLandscape];
//    [UIViewController attemptRotationToDeviceOrientation];
  self.burstStatisticsTableViewCell =  [GateThirtyDaysBurstStatisticsTableViewCell loadThirtyDaysBurstStatisticsTableViewCell];
    self.burstStatisticsTableViewCell.burstcalpic = self.burstcalpic;
    [self.view addSubview:self.burstStatisticsTableViewCell];
    
    [self.burstStatisticsTableViewCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    self.burstStatisticsTableViewCell.selectBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    
}
//-(void)viewDidLayoutSubviews{
//    self.burstStatisticsTableViewCell.frame = CGRectMake(0, 0, 300, 300);
//}

- (void)viewWillAppear:(BOOL)animated
  {
    [super viewWillAppear:animated];
    //强制旋转竖屏
      [self ar_turnToLandscape];
      [self.navigationController.navigationBar setHidden:YES];

}
- (void)viewWillDisappear:(BOOL)animated{
    [self ar_turnToLandscape];
 
    [self.navigationController.navigationBar setHidden:NO];
}


- (void)alertAction:(id)sender {
//    [self ar_turnToLandscape];

    [self.navigationController popViewControllerAnimated:YES];
}

- (UIInterfaceOrientationMask)ar_supportedOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
