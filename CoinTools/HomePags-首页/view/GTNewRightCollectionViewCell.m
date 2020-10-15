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
//    self.tableView.bounces = NO;
    self.tableView.scrollEnabled = NO;
            self.tableView.showsVerticalScrollIndicator = NO;
            self.tableView.estimatedRowHeight = 0;
            self.tableView.estimatedSectionHeaderHeight = 0;
            self.tableView.estimatedSectionFooterHeight = 0;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
           gateTableRegisterNib(self.tableView, @"GTNewItmeListTableViewCell");
    
}
//-(void)setDatalist:(NSArray<NSArray<GTHomeTitleModel *> *> *)datalist{
//    _datalist = datalist;
//    [self.tableView reloadData];
//}
-(void)setAlldatalistModel:(GTAlldatalistModel *)alldatalistModel{
    _alldatalistModel = alldatalistModel;
    [self.tableView reloadData];
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
    return  _alldatalistModel.datalist.count+1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    GTNewItmeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTNewItmeListTableViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.firstLb.text  = _alldatalistModel.title.content;
        [GTStyleManager setStyleWhit: _alldatalistModel.title forLale: cell.secondLb];
        cell.secondLb.text = @"";
    }else{
        cell.firstLb.text  = [[GTDataManager getItemModelWhit: _alldatalistModel.datalist[indexPath.row-1]].firstObject.content isNotBlank]?[GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].firstObject.content:@"";
        cell.secondLb.text = [[GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].lastObject.content isNotBlank]?[GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].lastObject.content:@"";
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].firstObject forLale: cell.firstLb];
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].lastObject forLale: cell.secondLb];
        if ([GTDataManager getItemModelWhit:_alldatalistModel.datalist[indexPath.row-1]].count<=1) {
            cell.secondLb.text = @"";
        }
    }
   
    if (indexPath.row%2 == 0) {
         cell.backgroundColor = gateColor(@"F5F5F5");
    }else{
        cell.backgroundColor = gateColor(@"ffffff");
    }
   
    
   return cell;
}


@end
