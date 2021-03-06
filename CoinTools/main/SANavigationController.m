//
//  SANavigationController.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/7.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SANavigationController.h"

@interface SANavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SANavigationController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        //去掉底部线条
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *))
    {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
    self.interactivePopGestureRecognizer.delegate = self;
    [self.navigationBar setBarTintColor:gateColor(@"343b44")];

//    self.navigationBar.backgroundColor = gateColor(@"343b44");
//    self.navigationBar.translucent = NO;
//    [self.navigationBar setTitleTextAttributes:
//
//     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
//
//       NSForegroundColorAttributeName:bkColor}];
//     self.navigationBar.barTintColor = naverTextColor;
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"data_list_tabrbg.png"] forBarMetrics:UIBarMetricsDefault];
//   [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
           self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (self.childViewControllers.count>0) {
        
//      [self setNavLeftItemTitle:nil ImageName:@"backicon" WithAction:@"backAction"];
        
        UIButton * backItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [backItem setImage: getImage(@"back_28x28_@2x") forState:UIControlStateNormal];
        [backItem setImage:getImage(@"back_28x28_@2x") forState:UIControlStateHighlighted];
        
        [backItem setTitle:@"" forState:UIControlStateNormal];
        [backItem setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        backItem.titleLabel.font = [UIFont systemFontOfSize:15];
        backItem.size = CGSizeMake(40, 40);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backItem];
        backItem.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);

        [backItem addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
    
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    return  [super popViewControllerAnimated:animated];
}
-(void)back{
    
    [self popViewControllerAnimated:YES];
}
//手势识别器会调用这个代理方法YES 有效  NO没有效果
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //    if (self.childViewControllers.count==1) {
    //         return NO;
    //    }
    //    return YES;
    return self.childViewControllers.count>1;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
      return UIStatusBarStyleDefault;
}
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}



@end
