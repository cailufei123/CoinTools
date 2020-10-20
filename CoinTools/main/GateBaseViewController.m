//
//  GateBaseViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBaseViewController.h"
#import "zhPopupController.h"
#import "GTMenuSelectView.h"
#import "GateTopSelectView.h"
@interface GateBaseViewController ()
@property (nonatomic, strong) zhPopupController *popupController;
@property (nonatomic, strong)  GTMenuSelectView *curtainView;
@property (nonatomic, strong)  GateTopSelectView *topSelectView;
@property (nonatomic, strong) UIButton * claseBt ;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation GateBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTable];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         UIView * selectView = [[UIView alloc] initWithFrame:CGRectMake(scrWeiht-40, 0, 40, 40)];
//           selectView.backgroundColor = [UIColor redColor];
           [self.view addSubview:selectView];
      UIButton * claseBt = [[UIButton alloc] initWithFrame:selectView.bounds];
        self.claseBt = claseBt;
//        claseBt.backgroundColor = [UIColor orangeColor];
        claseBt.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [selectView addSubview:claseBt];
        [claseBt setImage:getImage(@"add_14x14_@3x") forState:UIControlStateNormal];
        
        [claseBt addTarget:self action:@selector(claseBtAction:) forControlEvents:UIControlEventTouchUpInside];
    });
    
    
    
    self.topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-39, 40) categoryTitleViewStyle:CategoryZoomScale];
    
          [self.view addSubview:self.topSelectView];
    @weakify(self)
    self.topSelectView.selectBlock = ^(NSInteger index, NSString * _Nonnull title) {
         @strongify(self)
        [self selectitemOrindex:index string:title];
      
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          self.titles = @[@"all",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",@"全部",@"BTC", @"ETH", @"XRP", @"BCH",];
        self.topSelectView.titles = self.titles;
        
       
    });

}
-(NSInteger)selectedIndex{
     return self.topSelectView.categoryView.selectedIndex;
}

//-(void)selectitemOrindex:(NSInteger)index{
//      self.claseBt.transform = CGAffineTransformIdentity;
//}

-(void)claseBtAction:(UIButton * )claseBt{
    [self.popupController showInView:self.view duration:0.0 bounced:YES completion:nil];
     self.curtainView.titles = self.titles;
     [self.curtainView selectUICollectionViewitem:self.topSelectView.categoryView.selectedIndex];
    [UIView animateWithDuration:0.3f animations:^{

        [self.curtainView.closeButton setTransform:CGAffineTransformRotate(self.curtainView.closeButton.transform, M_PI/4)];

        }];

}




- (UIView *)listView {
  
    return self.view;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 40,  self.view.bounds.size.width, self.view.bounds.size.height-40);
   
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
-(void)createTable{
    

    self.tableView.backgroundColor = UIColor.whiteColor;
if (@available(iOS 11.0, *)) {
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
              }else {
    self.automaticallyAdjustsScrollViewInsets = NO;
        }
     
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
     [self.view addSubview:self.tableView];
   
}




- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
      return 0.01;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath



#pragma mark - Qzone style

- (zhPopupController *)popupController {
    if (!_popupController) {
        self.curtainView = [[GTMenuSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, scrHeiht-(kTopHeight + 40))];
        @weakify(self)
         
         self.curtainView.selectBlockItme = ^(NSInteger index,BOOL isClose) {
             
            @strongify(self)
             isClose?:[self.topSelectView.categoryView selectItemAtIndex:index];
           
             [self.popupController dismissWithDuration:0 delay:0.3 options:0 completion:nil];
            
        };

        
        _popupController = [[zhPopupController alloc] initWithView: self.curtainView  size: self.curtainView .bounds.size];
        _popupController.layoutType = zhPopupLayoutTypeTop;
        _popupController.presentationStyle = zhPopupSlideStyleFade;
        _popupController.offsetSpacing = 0;
         _popupController.maskType = zhPopupMaskTypeClear;
        _popupController.panGestureEnabled = NO;
        _popupController.dismissOnMaskTouched = NO;
       
        _popupController.willPresentBlock = ^(zhPopupController * _Nonnull popupController) {
          
        };
        
        _popupController.willDismissBlock = ^(zhPopupController * _Nonnull popupController) {
          
        };
    }
    return _popupController;
}

#pragma mark CYLTableViewPlaceHolderDelegate

- (UIView *)makePlaceHolderView{
    __block UIView *emptyView ;
    @weakify(self)
    emptyView =  [HYDEEmptyViewManager showEnptyWith:self.isError?NoNetwork:NoData reloadBlock:^{
        @strongify(self)

        [self.tableView startRefreshing];
    }];
    return emptyView;
}
- (BOOL)enableScrollWhenPlaceHolderViewShowing{
    return YES;
}

- (BOOL)removePlaceHolderView{
    return YES;
}


@end
