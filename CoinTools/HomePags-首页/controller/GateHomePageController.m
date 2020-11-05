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

#import "GateBurstViewController.h"

#import "GateHomePageTopEnterViewCell.h"
#import "GateFearIndexTableViewCell.h"
#import "GateHoldCoinViewController.h"
#import "GTTotalViewController.h"
#import "GTNewTopTableViewCell.h"
#import "GTMainCoinQuotationListTableViewCell.h"
#import "GTFearIndexViewController.h"
#import "GateFaceOrientationLandStatisticsViewController.h"
@interface GateHomePageController ()
@property(nonatomic,strong)NSArray * classArry;
@property(nonatomic,strong)GTHomeModel * homeModel;
@property (nonatomic, assign) BOOL isError;
@end

@implementation GateHomePageController
+(void)pushHomePageController{
    GateHomePageController * vc = [[GateHomePageController alloc] init];
    [[self getCurrentVC].navigationController pushViewController:vc animated:YES];
}
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    self.tableView.frame = CGRectMake(0, 0,  self.view.bounds.size.width, scrHeiht);
//
//
//}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0 , scrWeiht, scrHeiht) style:UITableViewStyleGrouped];
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
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;

    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *temp in windows) {
            if (temp.windowLevel == UIWindowLevelNormal) {
                window = temp;
                break;
            }
        }
    }
    //取当前展示的控制器
    result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    //如果为UITabBarController：取选中控制器
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    //如果为UINavigationController：取可视控制器
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result visibleViewController];
    }
    return result;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTable];
    self.classArry = [NSArray arrayWithObjects:@"GTTotalViewController",@"GateBurstViewController",@"GateNewDetailsViewController",@"GateBigOrderStatisticsViewController",@"GateWholeNetworkPositionStatisticsViewController",@"GateHoldCoinViewController" ,nil];
    self.tableView.frame = CGRectMake(0,kTopHeight , scrWeiht, scrHeiht-kTopHeight);
     self.tableView.backgroundColor = gateColor(@"f5f5f5");
    gateTableRegisterClass(self.tableView, @"GTNewTopTableViewCell");
    gateTableRegisterClass(self.tableView, @"GateHomePageTopEnterViewCell");
    gateTableRegisterNib(self.tableView, @"GateFearIndexTableViewCell");
    gateTableRegisterNib(self.tableView, @"GTMainCoinQuotationListTableViewCell");
    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
    [imag addSubview:[UIImageView wh_imageViewWithPNGImage:getImageName(@"icon_logon_d_logo_145x51_@2x") frame:imag.frame]];
  self.navigationItem.titleView  = imag;
    
    [EasyLodingView showLodingText:@"" imageName:getImageName(@"loading_0_30x30_@3x") config:^EasyLodingConfig *{
      
        return [EasyLodingConfig shared].setLodingType(LodingShowTypeImageAround).setTintColor(UIColor.redColor).setBgColor([[UIColor grayColor] colorWithAlphaComponent:0.2]);
    }];
    [self loadData];
    @weakify(self)
  [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
      @strongify(self)
      [self loadData];
}];

      
   
}
-(void)loadData{
    @weakify(self)

     [GateRequestManager getCache:homepagegURL block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.homeModel = [GTHomeModel modelWithDictionary:response[@"data"]];
             [EasyLodingView hidenLoding];
         }else{
             self.isError = YES;
           
         }
         if (!isCache) {
             
         }
      
         [self.tableView endRefreshing];
         [self.tableView cyl_reloadData];
                           
        
    }];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section == 2||section == 3){
          return 10.01;
    }
    return 0.01;
  
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return   self.homeModel?1:0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 if (indexPath.section == 0){
    CGFloat height = [tableView
                       fd_heightForCellWithIdentifier:@"GTNewTopTableViewCell"
                       cacheByIndexPath:indexPath
                       configuration:^(id cell) {

                        }];
     return height;
 }else  if (indexPath.section == 1){
      CGFloat height = [tableView
                            fd_heightForCellWithIdentifier:@"GateHomePageTopEnterViewCell"
                            cacheByIndexPath:indexPath
                            configuration:^(id cell) {
          GateHomePageTopEnterViewCell * cell1 = cell;
                    
 cell1.homepagebox = self.homeModel.homepagebox;
                             }];
          return height;
 }
 else  if (indexPath.section == 2){
      return 180;
      CGFloat height = [tableView
                            fd_heightForCellWithIdentifier:@"GateFearIndexTableViewCell"
                            cacheByIndexPath:indexPath
                            configuration:^(id cell) {

                             }];
          return height;
 }else  if (indexPath.section == 3){
      return 440+120;
      CGFloat height = [tableView
                            fd_heightForCellWithIdentifier:@"GTMainCoinQuotationListTableViewCell"
                            cacheByIndexPath:indexPath
                            configuration:^(id cell) {

                             }];
          return height;
 }
    return 230;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        
        
        
        
        GTNewTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTNewTopTableViewCell" forIndexPath:indexPath];
        cell.selectBlock = ^(NSInteger index) {
            @weakify(self)
       
         
            GTTotalViewController * totalVc = [[GTTotalViewController alloc] init];
            totalVc.index = index;
            [self.navigationController pushViewController:totalVc animated:YES];
        };
        cell.homepage_navigation = self.homeModel.homepage_navigation;
                  return cell;
        
        
    }else if (indexPath.section == 1){
        
        GateHomePageTopEnterViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHomePageTopEnterViewCell" forIndexPath:indexPath];
        cell.selectBlock = ^(NSInteger index) {
            
               GTTotalViewController * totalVc = [[GTTotalViewController alloc] init];
               totalVc.index = index;
               [self.navigationController pushViewController:totalVc animated:YES];
        };
        
        cell.lb.text = [GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][0].content;
       
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][0] forLale:cell.lb];
        cell.homepagebox = self.homeModel.homepagebox;
                  return cell;
    }else if (indexPath.section == 2){
        GateFearIndexTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateFearIndexTableViewCell" forIndexPath:indexPath];
        
        cell.titleLb.text = [GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][1].content;
       
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][1] forLale:cell.titleLb];
        cell.homevix = self.homeModel.homepagevix;
        return cell;
    }else if (indexPath.section == 3){
      
        GTMainCoinQuotationListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTMainCoinQuotationListTableViewCell" forIndexPath:indexPath];
      cell.homepaglist = self.homeModel.homepaglist;
        cell.titleLb.text = [GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][2].content;
       
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.homeModel.homepagebigtitle.alldatalist.firstObject.datalist.firstObject][2] forLale:cell.titleLb];
        return cell;
    }
    
    return nil;
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        GTFearIndexViewController * fearIndexVc = [[GTFearIndexViewController alloc] init];
        fearIndexVc.homevix =  self.homeModel.homepagevix;
       
        [self.navigationController pushViewController:fearIndexVc animated:YES];
    }
    
}

- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
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
