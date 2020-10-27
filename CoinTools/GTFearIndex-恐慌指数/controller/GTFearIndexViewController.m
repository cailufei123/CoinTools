//
//  GTFearIndexViewController.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTFearIndexViewController.h"
#import "GTFearIndexLineChartsTableViewCell.h"
#import "GTFearIndexModel.h"
#import "GTFearIndexIndicatorTableViewCell.h"
#import "GateHoursSelectCategoryView.h"
@interface GTFearIndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)GTFearIndexModel *fearIndexModel;

@property(nonatomic,strong)NSArray * littes;
@property (nonatomic, assign) NSInteger index;
@property(nonatomic,strong)NSMutableArray * lineDatas;
@property (nonatomic, copy) NSString * v_ts;

@property(nonatomic,strong)NSMutableArray * dataArrs;

@end

@implementation GTFearIndexViewController


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
  
    self.tableView.frame = CGRectMake(0,kTopHeight , scrWeiht, scrHeiht-kTopHeight);
     self.tableView.backgroundColor = gateColor(@"f5f5f5");

    gateTableRegisterNib(self.tableView, @"GTFearIndexLineChartsTableViewCell");
     gateTableRegisterNib(self.tableView, @"GTFearIndexIndicatorTableViewCell");
  
    UIView * imag = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
    [imag addSubview:[UIImageView wh_imageViewWithPNGImage:getImageName(@"icon_logon_d_logo_145x51_@2x") frame:imag.frame]];
  self.navigationItem.titleView  = imag;
    
    

       @weakify(self)
          [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
               @strongify(self)
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [self loadDataWhit:1];
                  });
          }];
  
    [GTStyleManager loadingImage];
    [self loadData:0];

   
}

-(void)loadDataWhit:(NSInteger)index{
    self.index = index;
    if (index == 0) {
        self.v_ts = @"all";
    }else if (index == 1) {
        self.v_ts = @"month";
    }else if (index == 2) {
        self.v_ts = @"week";
    }
    [GTStyleManager loadingImage];
    [self loadData:1];
}

-(void)loadData:(NSInteger)index{
    @weakify(self)
    NSString * url = nil;
    if (index == 0) {
        url = vixURL;
    }else if(index == 1){
        url = vix_v_tsURL(self.v_ts);
    }
    
          
     [GateRequestManager getCache:url block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
         [self.dataArrs removeAllObjects];
         if (!error) {
//             self.isError = NO;
             self.fearIndexModel = [GTFearIndexModel modelWithDictionary:response[@"data"]];
        
             self.homevix =  self.fearIndexModel.homepagevix;
            
         }else{
//             self.isError = YES;
           
         }
       
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
       
                           
        
    }];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section == 1) {
            return 60;
    }else{
        return 0.01;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
         return [UIView new];
    }else{
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                              selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
        selectCategoryView.categoryView.defaultSelectedIndex = self.index;
        selectCategoryView.titleLb.text =getItemModel(self.fearIndexModel.vix_bigtitle.alldatalist.firstObject.datalist.firstObject).firstObject.content;
        setStyle(getItemModel(self.fearIndexModel.vix_bigtitle.alldatalist.firstObject.datalist.firstObject).firstObject, selectCategoryView.titleLb);
                             selectCategoryView.selectblock = ^(NSInteger index) {
                              
                                 [self loadDataWhit:index];
                             };
                 
                                 return selectCategoryView;
    }
     
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.fearIndexModel.vix_info?1:0;
 

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

      
    if (indexPath.section == 0) {
        return 150;
    }else{
        return 230;
    }
    

    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
       
    if (indexPath.section == 0) {
         GTFearIndexIndicatorTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTFearIndexIndicatorTableViewCell" forIndexPath:indexPath];
        cell.homevix = self.homevix;
                         return cell;
    }else{
        GTFearIndexLineChartsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTFearIndexLineChartsTableViewCell" forIndexPath:indexPath];
           cell.fearIndexPublicContentModel = self.fearIndexModel.vix_info;
                         return cell;
    }
    

   
}

@end
