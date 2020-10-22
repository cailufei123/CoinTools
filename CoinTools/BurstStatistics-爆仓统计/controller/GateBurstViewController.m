//
//  GateBurstViewController.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstViewController.h"
#import "GateTopSelectView.h"
#import "GateHoursTableViewCell.h"
#import "GateBurstHouseTableViewCell.h"
#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
#import "GateHousBurstStatisticsTableViewCell.h"
#import "GateHoursSelectCategoryView.h"
#import "GateCoinBurstStatisticsTableViewCell.h"
#import "GateBurstListTableViewCell.h"
#import "GTBurstModel.h"
#import "GTHeYueMessageTableViewCell.h"
@interface GateBurstViewController ()
@property(nonatomic,strong)GTBurstModel * burstModel;

@property (nonatomic, copy) NSString * v_ts;
@property (nonatomic, copy) NSString * v_coin_type;

@property (nonatomic, assign) NSInteger index;
@end

@implementation GateBurstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
        gateTableRegisterNib(self.tableView, @"GateHoursTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateBurstHouseTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateThirtyDaysBurstStatisticsTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateHousBurstStatisticsTableViewCell");
        gateTableRegisterClass(self.tableView, @"GateCoinBurstStatisticsTableViewCell");
        gateTableRegisterClass(self.tableView, @"GTHeYueMessageTableViewCell");
        gateTableRegisterNib(self.tableView, @"GateBurstListTableViewCell");
    self.tableView.backgroundColor = [UIColor whiteColor];
    
 
 
 
    @weakify(self)
       [self.tableView addPullToRefresh:[LNHeaderMeituanAnimator createAnimator] block:^{
            @strongify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (self.selectedIndex == 0) {
                    [self loadData];
                }else{
                    [self loadData1];
                }
             

               });
       }];
    
    [EasyLodingView showLodingText:@"" imageName:getImageName(@"loading_0_30x30_@3x") config:^EasyLodingConfig *{
        return [EasyLodingConfig shared].setLodingType(LodingShowTypeImageAround).setTintColor(UIColor.redColor).setBgColor([[UIColor grayColor] colorWithAlphaComponent:0.2]);
    }];
    [self loadData];
//
}

-(void)loadData{
    @weakify(self)
           self.index = 0;
     [GateRequestManager getCache:baoCangURL block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.burstModel = [GTBurstModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
//         [self.tableView cyl_reloadData];
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
       
                           
        
    }];
    
}
-(void)selectitemOrindex:(NSInteger)index string:(nonnull NSString *)title{
    self.v_coin_type = title;
    [self.tableView endRefreshing];
    [self.tableView startRefreshing];
   
   
}
-(void)loadData1{
    @weakify(self)
   
     [GateRequestManager getCache:baocang_v_coin_typeURL(self.v_coin_type) block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.burstModel = [GTBurstModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
        
//         [self.tableView cyl_reloadData];
        
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
      
    }];
    
}

-(void)loadData2{
    @weakify(self)
    [GTStyleManager loadingImage];
    NSLog(@"%@",baocang_v_tsURL(self.v_coin_type,self.v_ts));
     [GateRequestManager getCache:baocang_v_tsURL(@"ALL",self.v_ts) block:^(NSError * _Nonnull error, BOOL isCache, NSDictionary * _Nonnull response) {
           @strongify(self)
        
       
         if (!error) {
             self.isError = NO;
             self.burstModel = [GTBurstModel modelWithDictionary:response[@"data"]];
            
         }else{
             self.isError = YES;
           
         }
//         [self.tableView cyl_reloadData];
         if (!isCache) {
             [EasyLodingView hidenLoding];
             [self.tableView endRefreshing];
             [self.tableView cyl_reloadData];
         }
        
        
  
    }];
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
     return 60;
    

}

-(void)loadDataWhit:(NSInteger)index{
    self.index = index;
    if (index == 0) {
        self.v_ts = @"1h";
    }else if (index == 1) {
        self.v_ts = @"4h";
    }else if (index == 2) {
        self.v_ts = @"24h";
    }
    
    [self loadData2];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    @weakify(self)
    if (!self.burstModel) {
        return [[UIView alloc] init];
    }
   
    if (section == 2){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
        if (self.selectedIndex == 0) {
           
             selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
            selectCategoryView.categoryView.defaultSelectedIndex = self.index;
        }else{
            selectCategoryView.titles =  @[];
        }
      
        selectCategoryView.title = [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][2].content;
        
        [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][2] forLale:selectCategoryView.titleLb];
        
     
            selectCategoryView.selectblock = ^(NSInteger index) {
                @strongify(self)
                [self loadDataWhit:index];
            };
                return selectCategoryView;
    }else if (section == 3){
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
     
                 if (self.selectedIndex == 0) {
                        selectCategoryView.titles =  @[@"1H",@"4H",@"24H"];
                     selectCategoryView.categoryView.defaultSelectedIndex = self.index;
                    
                   }else{
                       selectCategoryView.titles =  @[];
                   }
               
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       @strongify(self)
                       [self loadDataWhit:index];
                      
                      
                   };
        selectCategoryView.title = [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][3].content;
        [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][3] forLale:selectCategoryView.titleLb];
        
                       return selectCategoryView;
    }else {
        GateHoursSelectCategoryView * selectCategoryView = [[GateHoursSelectCategoryView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-100, 50)];
                   selectCategoryView.titles =  @[];
        selectCategoryView.title = [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][section].content;
        [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:self.burstModel.burstbigtitle.alldatalist.firstObject.datalist.firstObject][section] forLale:selectCategoryView.titleLb];
                   selectCategoryView.selectblock = ^(NSInteger index) {
                       
                       
                   };
                       return selectCategoryView;
    }
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 0;
    if (self.selectedIndex == 0) {
        return 5;
    }else{
        return 4;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return  self.burstModel?1:0;
    }else  if (section == 1){
        if (self.selectedIndex == 0) {
            return  self.burstModel?1:0;
        }else{
            return  self.burstModel?1:0;
        }
      
       
   }else if (section == 2){
       if (self.selectedIndex == 0) {
           return self.burstModel.burstbourse.alldatalist[1].datalist.firstObject.count;
             }else{
                 return  self.burstModel?1:0;
             }
      
   }else if (section == 3){
        
       if (self.selectedIndex == 0) {
           return self.burstModel?1:0;
                   }else{
                       return  self.burstModel.burstdtl.alldatalist.firstObject.datalist.count;
                   }
            
   }else if (section == 4){
         return  self.burstModel.burstdtl.alldatalist.firstObject.datalist.count;
   }else {
       return  self.burstModel?1:0;
   }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 0) {
             CGFloat height = [tableView
                                          fd_heightForCellWithIdentifier:@"GateHoursTableViewCell"
                                          cacheByIndexPath:indexPath
                                          configuration:^(id cell) {
                 GateHoursTableViewCell *cell1 = cell;
                 cell1.burstinfo = self.burstModel.burstinfo;
                 if (self.selectedIndex == 0) {
                     cell1.bagView.hidden = NO; cell1.loyoutH.constant = 65;
                 }else{
                     cell1.bagView.hidden = YES; cell1.loyoutH.constant = 5;
                 }
                                           }];
                     return height;
       }else if (indexPath.section == 1){
           
           if (self.selectedIndex == 0) {
            CGFloat height = [tableView
                           fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                                                cacheByIndexPath:indexPath
                                                                configuration:^(id cell) {
                           GateThirtyDaysBurstStatisticsTableViewCell *cell1 = cell;
                           
             
                
cell1.burstcalpic =  self.burstModel.burstcalpic;
                                                                 }];
                                           return height;
           }else{
               CGFloat height = [tableView
                                         fd_heightForCellWithIdentifier:@"GTHeYueMessageTableViewCell"
                                                                              cacheByIndexPath:indexPath
                                                                              configuration:^(id cell) {
                   GTHeYueMessageTableViewCell *cell1 = cell;
                                         
                   cell1.burstfuture = self.burstModel.burstfuture;
                                                                               }];
                                                         return height;
               
           }
           
       }else if (indexPath.section == 2){
            
           if (self.selectedIndex == 0) {
                return 50;
           
           }else{
             CGFloat height = [tableView
                                       fd_heightForCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell"
                                                                            cacheByIndexPath:indexPath
                                                                            configuration:^(id cell) {
                                       GateThirtyDaysBurstStatisticsTableViewCell *cell1 = cell;
                                       
                 cell1.burstcalpic =  self.burstModel.burstcalpic;
                                                                             }];
                                                       return height;
               
           }
       }else if (indexPath.section == 3){
           
           
           if (self.selectedIndex == 0) {
                      CGFloat height = [tableView
                                                                                          fd_heightForCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell"
                                                                                          cacheByIndexPath:indexPath
                                                                                          configuration:^(id cell) {
                                         
                                         GateCoinBurstStatisticsTableViewCell *cell1 = cell;
                                     
                                         cell1.burstcoin = self.burstModel.burstcoin;
                                                                                           }];
                                                                     return height;
                     
                     }else{
                         CGFloat height = [tableView
                                                                              fd_heightForCellWithIdentifier:@"GateBurstListTableViewCell"
                                                                              cacheByIndexPath:indexPath
                                                                              configuration:^(id cell) {
                             GateBurstListTableViewCell*cell1 = cell;
                            
                             cell1.indexPath = indexPath;
                             cell1.burstdtl = self.burstModel.burstdtl;
                                                                               }];
                                                         return height;
                         
                     }
       }else if (indexPath.section == 4){
            CGFloat height = [tableView
                                                                 fd_heightForCellWithIdentifier:@"GateBurstListTableViewCell"
                                                                 cacheByIndexPath:indexPath
                                                                 configuration:^(id cell) {
                GateBurstListTableViewCell*cell1 = cell;
               
                cell1.indexPath = indexPath;
                cell1.burstdtl = self.burstModel.burstdtl;
                                                                  }];
                                            return height;
       }else {
           return 50;
      }
   
}
        
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        GateHoursTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHoursTableViewCell" forIndexPath:indexPath];
        cell.burstinfo = self.burstModel.burstinfo;
        if (self.selectedIndex == 0) {
            cell.bagView.hidden = NO; cell.loyoutH.constant = 65;
        }else{
            cell.bagView.hidden = YES; cell.loyoutH.constant = 0;
        }
              return cell;
       }else if (indexPath.section == 1)  {
           if (self.selectedIndex == 0) {
            GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
              cell.burstcalpic =  self.burstModel.burstcalpic;
                                     return cell;
           }else{
               GTHeYueMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTHeYueMessageTableViewCell" forIndexPath:indexPath];
               cell.burstfuture = self.burstModel.burstfuture;
                                                   return cell;
               
           }
         
       }else  if (indexPath.section == 2)  {
           if (self.selectedIndex == 0) {
                      GateHousBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateHousBurstStatisticsTableViewCell" forIndexPath:indexPath];
               cell.indexPath = indexPath;
               cell.burstbourse = self.burstModel.burstbourse;
               
                                            return cell;
                     }else{
                    GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                         cell.burstcalpic =  self.burstModel.burstcalpic;
                                                            return cell;
                     }
         
       }else  if (indexPath.section == 3)  {
        
           if (self.selectedIndex == 0) {
             GateCoinBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateCoinBurstStatisticsTableViewCell" forIndexPath:indexPath];
               cell.burstcoin = self.burstModel.burstcoin;
                                  return cell;
            }else{
           GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
                cell.indexPath = indexPath;
                cell.burstdtl = self.burstModel.burstdtl;
                                 return cell;
            }
       }else  if (indexPath.section == 4)  {
          GateBurstListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateBurstListTableViewCell" forIndexPath:indexPath];
           cell.indexPath = indexPath;
           cell.burstdtl = self.burstModel.burstdtl;
                       return cell;
       }else  {
          GateThirtyDaysBurstStatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateThirtyDaysBurstStatisticsTableViewCell" forIndexPath:indexPath];
                       return cell;
       }
   
}

@end
