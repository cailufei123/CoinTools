//
//  GateMarketValueViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/7.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateMarketValueViewController.h"
#import "GateMarketValueCell.h"
@interface GateMarketValueViewController ()

@end

@implementation GateMarketValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle  =@"持币";
  
       self.tableView.frame = CGRectMake(0,kTopHeight, scrWeiht, self.view.bounds.size.height-0);
      
   
     gateTableRegisterNib(self.tableView, @"GateMarketValueCell");
  
       GateRefreshNormalHeader * header = [GateRefreshNormalHeader headerWithRefreshingBlock:^{
           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [self.tableView.mj_header endRefreshing];
           });
       }];
     
        GateRefreshAutoNormalFooter *footer = [GateRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableView.mj_footer endRefreshing];
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            });
            
        }];
       self.tableView.mj_footer = footer;
       self.tableView.mj_header = header;
    self.tableView.mj_footer.hidden = YES;
//    [self setDate];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 60 ;
}



  -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 80;

  }
  -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
       GateMarketValueCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GateMarketValueCell" forIndexPath:indexPath];
                                                 return cell;
     
  }
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       GateMarketValueCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.highlightView.isHidden == YES){
         cell.highlightView.hidden = NO;
    }else{
         cell.highlightView.hidden = YES;
    }
    
    
     cell.highlightView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//          [UIView animateWithDuration:1 animations:^{
//
//               cell.highlightView.hidden=YES;
//          }];
            cell.highlightView.hidden=YES;
         
      });
    
        cell.highlightView.backgroundColor = [UIColor colorGradientChangeWithSize: cell.highlightView.clf_size direction:HYDEGradientChangeDirectionLevel startColor:[UIColor.whiteColor colorWithAlphaComponent:0.0] endColor:[UIColor.greenColor colorWithAlphaComponent:0.4]];

}

@end
