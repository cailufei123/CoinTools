//
//  GateViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateViewController.h"
#import "GateDetailsViewController.h"
#import "JXCategoryView.h"
#import "GateTopView.h"
@interface GateViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@end
@implementation GateViewController
- (JXCategoryTitleView *)categoryView {
    if (_categoryView == nil) {
       _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(80, 0, scrWeiht-140, 44)];
        _categoryView.delegate = self;
        _categoryView.titleColor = gateColor(@"727272");
         _categoryView.titleSelectedColor = gateColor(hearTitleColor);
         _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleFont = gateFont(16, Medium);
         _categoryView.titleSelectedFont = gateFont(16, Medium);
        
       
           JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
           lineView.indicatorColor = gateColor(@"00d9c2");
           lineView.indicatorWidth = 20;
           _categoryView.indicators = @[lineView];

    }
    return _categoryView;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //处于第一个item的时候，才允许屏幕边缘手势返回
//    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   self.titles = @[@"BTC", @"ETH", @"XRP", @"BCH",];
     self.categoryView.titles = self.titles;
     [self.view addSubview:self.categoryView];
   
      [self.view addSubview:self.listContainerView];
 
   self.categoryView.listContainer = self.listContainerView;
    GateTopView * topView  = [[GateTopView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    topView.backgroundColor = [UIColor redColor];
     UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithCustomView:topView];
//    self.navigationController.navigationBar
    UIView * temp = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 100)];
    [temp addSubview:self.categoryView];
//      self.navigationItem.leftBarButtonItem =  item;
    self.navigationItem.titleView = temp;
}

- (JXCategoryListContainerView *)listContainerView {
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(self.categoryView.frame);
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        
          self.listContainerView.frame = CGRectMake(0, CGRectGetMaxY(_categoryView.frame), self.view.bounds.size.width,  contentViewHeight);
        
    }
    return _listContainerView;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

   
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
    GateDetailsViewController *list = [[GateDetailsViewController alloc] init];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         list.tableView.frame = self.categoryView.bounds;
//    });
    list.type = self.titles[index];
    return list;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

@end
