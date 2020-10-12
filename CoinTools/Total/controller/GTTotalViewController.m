//
//  GTTotalViewController.m
//  CoinTools
//
//  Created by MAC on 2020/9/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTTotalViewController.h"
#import "GateTopSelectView.h"

#import "GateBurstViewController.h"//爆仓
#import "GateWholeNetworkPositionStatisticsViewController.h"//持仓
#import "GateBigOrderStatisticsViewController.h"//大单
#import "GateNewDetailsViewController.h"//合约
#import "GateHoldCoinViewController.h"//持币
#import "GTMultiSpaceRatioViewController.h"//多空比
@interface GTTotalViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) NSArray *titles;
//@property(nonatomic,strong) GateTopSelectView * topSelectView;
@property (nonatomic, strong) GateTopSelectView *topCategoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *controllerList;
@end

@implementation GTTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.titles = @[@"爆仓数据",@"合约持仓", @"多空比", @"大单成交", @"持币",];
   self.topCategoryView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, kTopHeight, scrWeiht, 40) categoryTitleViewStyle:CategoryStyleDefault];
    self.topCategoryView.categoryView.titles = self.titles;
    self.topCategoryView.lineView.hidden = NO;
    self.topCategoryView.categoryView.titleColor = gateColor(@"7d7d7d");
    self.topCategoryView.categoryView.titleSelectedColor = gateColor(@"db5859");
    self.topCategoryView.categoryView.titleFont = gateFont(16, Medium);
    self.topCategoryView.categoryView.titleSelectedFont = gateFont(16, Medium);

    [self.topCategoryView.categoryView setDefaultSelectedIndex:self.index];
  
    self.topCategoryView.categoryView.listContainer = self.listContainerView;
    self.listContainerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topCategoryView];
    [self.view addSubview:self.listContainerView];
    
    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
       [imag addSubview:[UIImageView wh_imageViewWithPNGImage:getImageName(@"icon_logon_d_logo_145x51_@2x") frame:imag.frame]];
     self.navigationItem.titleView  = imag;
}


-(NSArray *)controllerList{
    if (!_controllerList) {
        _controllerList = [NSArray arrayWithObjects:[[GateBurstViewController alloc] init],[[GateWholeNetworkPositionStatisticsViewController alloc] init],[[GTMultiSpaceRatioViewController alloc] init],[[GateBigOrderStatisticsViewController alloc] init],[[GateHoldCoinViewController alloc] init], nil];
    }
    return _controllerList;
}
- (JXCategoryListContainerView *)listContainerView {
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(self.topCategoryView.frame);
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        
          self.listContainerView.frame = CGRectMake(0, CGRectGetMaxY(_topCategoryView.frame), self.view.bounds.size.width,  contentViewHeight);
        
    }
    return _listContainerView;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
//    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
  
  
    return self.controllerList[index];
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.controllerList.count;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

   
}
@end
