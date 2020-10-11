//
//  GTChartPMarkerPublicView.m
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTChartPMarkerPublicView.h"
#import "GTChartPMarkerViewTableViewCell.h"
@implementation GTChartPMarkerPublicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTable];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
   [self createTable];
    gateTableRegisterNib(self.tableView, @"GTChartPMarkerViewTableViewCell");
}
-(void)setPublicSelectModels:(NSArray *)publicSelectModels{
    _publicSelectModels = publicSelectModels;
    

      [self.tableView reloadData];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _tableView;
}
-(void)createTable{
    

    self.tableView.backgroundColor = UIColor.whiteColor;
if (@available(iOS 11.0, *)) {
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
              }else {
   
        }
     
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
     [self addSubview:self.tableView];
     [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_offset(0);
            make.bottom.mas_offset(0);
           make.right.mas_offset(0);
            make.left.mas_offset(0);
      }];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
   return 0.001;
  
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.001;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _publicSelectModels.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
  
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
        GTChartPMarkerViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTChartPMarkerViewTableViewCell" forIndexPath:indexPath];
    GatePublicSelectModel * publicSelectModel = _publicSelectModels[indexPath.row];
    cell.publicSelectModel = publicSelectModel;
//    cell.backgroundColor = [UIColor blueColor];
                  return cell;
 
}
@end
