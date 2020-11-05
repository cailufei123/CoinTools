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
#import "GateDeliveryPositionAmountCell.h"
#import "GTDuoKongLineChartsTableViewCell.h"
#import "GTFearIndexLineChartsTableViewCell.h"
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
 
    
    
    switch (self.chartsStype) {
        case baoCang:
        {
            
    self.burstStatisticsTableViewCell =  [GateThirtyDaysBurstStatisticsTableViewCell loadThirtyDaysBurstStatisticsTableViewCell];
    self.burstStatisticsTableViewCell.burstcalpic = self.burstcalpic;
            [self setTableViewCell:self.burstStatisticsTableViewCell];
            @weakify(self)
    self.burstStatisticsTableViewCell.selectBlock = ^{
                @strongify(self)
                [self.navigationController popViewControllerAnimated:YES];
    };
        }
          
            break;
        case chiCang:
        {
            GateDeliveryPositionAmountCell * positionAmountCell =  [GateDeliveryPositionAmountCell loadTableViewCell];
            positionAmountCell.holdData = self.burstcalpic;
                    [self setTableViewCell:positionAmountCell];
                    @weakify(self)
            positionAmountCell.selectBlock = ^{
                        @strongify(self)
                        [self.navigationController popViewControllerAnimated:YES];
            };
            
        }
            break;
        case duoKong:
        {
            GTDuoKongLineChartsTableViewCell * positionAmountCell =  [GTDuoKongLineChartsTableViewCell loadTableViewCell];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                positionAmountCell.duoKongData = self.burstcalpic;
            });
         
            [self setTableViewCell:positionAmountCell];
                    @weakify(self)
            positionAmountCell.selectBlock = ^{
                        @strongify(self)
                        [self.navigationController popViewControllerAnimated:YES];
            };
            
        }
            break;
        case kongHuang:
        {
            GTFearIndexLineChartsTableViewCell * positionAmountCell =  [GTFearIndexLineChartsTableViewCell loadTableViewCell];
            positionAmountCell.fearIndexPublicContentModel = self.burstcalpic;
                    [self setTableViewCell:positionAmountCell];
                    @weakify(self)
            positionAmountCell.selectBlock = ^{
                        @strongify(self)
                        [self.navigationController popViewControllerAnimated:YES];
            };
            
        }
        default:
            break;
    }
    
    
    
    
    
}


-(void)setTableViewCell:(UITableViewCell * )cell {
   
     
      [self.view addSubview:cell];
      
      [cell mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(0);
          make.top.mas_equalTo(0);
          make.bottom.mas_equalTo(0);
          make.right.mas_equalTo(0);
      }];
    
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
