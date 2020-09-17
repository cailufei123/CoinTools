//
//  GateNewDetailsViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/4.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateNewDetailsViewController.h"
#import "GateTopSelectView.h"
#import "GateHearCategoryView.h"
#import "pressView.h"
#import "GatePrgessTableViewCell.h"
#import "GateHearView.h"
#import "GateData1TableViewCell.h"
#import "GateData2TableViewCell.h"
#import "GateLineChartTableViewCell.h"
#import "GateHomeModel.h"
#import "GateBurstViewController.h"
@interface GateNewDetailsViewController ()
@property(nonatomic,strong)pressView *press;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic,strong)GateHomeModel *gateHomeModel;
@property(nonatomic,copy)NSString *type;

@property(nonatomic,strong) GateTopSelectView * topSelectView;
@end

@implementation GateNewDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"合约";
    self.type = @"BTC";
    [self creatTopSelectView];
    [self registerCreateTable];
    [self loadData];
}
-(void)loadData{
    
    GateRefreshNormalHeader * header = [GateRefreshNormalHeader headerWithRefreshingBlock:^{
 
        [GateRequestManager post:homeURL params:@{@"v_coin_type":self.type} success:^(id  _Nonnull response) {
            self.gateHomeModel =[GateHomeModel modelWithDictionary:response[@"data"]];
           
           
            self.topSelectView.titles = @[@"BTC", @"ETH", @"XRP", @"BCH",@"LTC",@"EOX",@"TRX"];
                self.categoryView.titles = self.titles;
            [self.categoryView reloadData];
            [self.tableView reloadData];
             [self.tableView.mj_header endRefreshing];
        } failure:^(NSError * _Nonnull failure) {
       [self.tableView.mj_header endRefreshing];
        }];
       }];
//       self.tableView.mj_header = header;
    
    
    [self.tableView.mj_header beginRefreshing];
    __weak typeof(self) wself = self;
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [wself.tableView endRefreshing];
               });
       }];
   
}
-(void)creatTopSelectView{
      self.topSelectView = [[GateTopSelectView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht, 40) categoryTitleViewStyle:CategoryZoomScale];
     [self.view addSubview:self.topSelectView];
//     self.tableView.frame = CGRectMake(0,CGRectGetMaxY(self.topSelectView.frame) , scrWeiht, self.view.bounds.size.height-CGRectGetMaxY(self.topSelectView.frame));
     self.tableView.backgroundColor = [UIColor whiteColor];
    [self registerCreateTable];
    @weakify(self)
    self.topSelectView.selectBlock = ^(NSInteger index, NSString * _Nonnull title) {
         @strongify(self)
        self.type = title;
         [self loadData];
    };
}

-(void)registerCreateTable{
    
    
      gateTableRegisterNib(self.tableView, @"GatePrgessTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateData1TableViewCell");
     gateTableRegisterNib(self.tableView, @"GateData2TableViewCell");
     gateTableRegisterNib(self.tableView, @"GateLineChartTableViewCell");
     gateTableRegisterNib(self.tableView, @"GateBurstTableViewCell");
    
    
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GatePrgessTableViewCell"];
//     [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GateData1TableViewCell"];
//     [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GateData2TableViewCell"];
//     [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GateLineChartTableViewCell"];
//    
//    [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GateBurstTableViewCell"];
    self.tableView.dataSource = self;
     self.tableView.delegate = self;
    self.tableView.backgroundColor = UIColor.whiteColor;
//       self.tableView.showsVerticalScrollIndicator = NO;
//     if (@available(iOS 11.0, *)) {
//          self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//      }else {
//          self.automaticallyAdjustsScrollViewInsets = NO;
//      }
     [self.view addSubview:self.tableView];
   
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        GateHearCategoryView  * hearView  =  [[GateHearCategoryView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht, 50)];
        hearView.selectblock = ^(NSInteger index) {
            GateLineChartTableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
            
            if (index == 0) {
                  cell.possArr = self.gateHomeModel.poss;
            }else{
                  cell.possArr = self.gateHomeModel.diff;
            }
        };
        return hearView;
    }else{
       
        GateHearView  * hearView  = [GateHearView getGateHearView];
         hearView.frame = CGRectMake(0, 0, scrWeiht, 50);
        
         if (section == 0) {
             hearView.nameLb.text = @"BTC";
         }
          return hearView;
    }
    
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{

      return 50;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 120;
    }else if (indexPath.section == 1){
         return 150;
    }else if (indexPath.section ==2){
         return 50;
    }else{
       
    CGFloat height = [tableView
                      fd_heightForCellWithIdentifier:@"GateLineChartTableViewCell"
                      cacheByIndexPath:indexPath
                      configuration:^(id cell) {
//         cell.possArr = self.gateHomeModel.poss;
//                           [(GateLineChartTableViewCell *)cell reloadCellWithData:self.listArray[indexPath.section]];
                       }];
    return height;
      
    }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
//         return 1;
        return self.gateHomeModel.long_short.count;
       }else if (section == 1){
            return 1;
       }else if (section == 2){
//            return 1;
          return self.gateHomeModel.burst_dtl.count;
       }else {
           return 1;
       }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
      GatePrgessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GatePrgessTableViewCell" forIndexPath:indexPath];
       cell.long_shortModel = self.gateHomeModel.long_short[indexPath.row];
        return cell;
   }else if (indexPath.section == 1) {
      GateData1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateData1TableViewCell" forIndexPath:indexPath];
       cell.h_burst_amtModel = self.gateHomeModel.burst_amt;
          return cell;
   }else if (indexPath.section == 2){
       GateData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateData2TableViewCell" forIndexPath:indexPath];
       cell.burst_dtl = self.gateHomeModel.burst_dtl[indexPath.row];
                return cell;
   }else {
       GateLineChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GateLineChartTableViewCell" forIndexPath:indexPath];
       cell.possArr = self.gateHomeModel.poss;
                return cell;
   }
   
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


@end
