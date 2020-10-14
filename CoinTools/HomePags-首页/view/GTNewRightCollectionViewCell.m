//
//  GTNewRightCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTNewRightCollectionViewCell.h"
#import "GTNewItmeListTableViewCell.h"
@implementation GTNewRightCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setTableView];
}
-(void)setTableView{

        self.tableView.backgroundColor = UIColor.whiteColor;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                  }
    self.tableView.bounces = NO;
            self.tableView.showsVerticalScrollIndicator = NO;
            self.tableView.estimatedRowHeight = 0;
            self.tableView.estimatedSectionHeaderHeight = 0;
            self.tableView.estimatedSectionFooterHeight = 0;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
           gateTableRegisterNib(self.tableView, @"GTNewItmeListTableViewCell");
    
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
    return 40;
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    GTNewItmeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTNewItmeListTableViewCell" forIndexPath:indexPath];
    if (indexPath.row%2 == 0) {
          cell.backgroundColor = gateColor(@"F5F5F5");
//          cell.nameLb.backgroundColor = gateColor(@"F5F5F5");
    }else{
        cell.backgroundColor = gateColor(@"ffffff");
//          cell.nameLb.backgroundColor = gateColor(@"ffffff");
    }
   
   cell.firstLb.text  =@"333";
    cell.secondLb.text  =@"444";
   return cell;
}


@end
