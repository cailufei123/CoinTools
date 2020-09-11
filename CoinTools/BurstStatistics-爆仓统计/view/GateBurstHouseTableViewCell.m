//
//  GateBurstHouseTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstHouseTableViewCell.h"
#define littleSpacing  (scrWeiht-30)/5-20

#define  spacing (scrWeiht-30 - (littleSpacing))/4

@interface GateBurstHouseTableViewCell()
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic,assign) NSInteger rowInSection;//每一组的行数


@end

@implementation GateBurstHouseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.housSpacing.constant = spacing;
    self.typeSpacing.constant =spacing;
    self.directionSpacing.constant  = littleSpacing;
    self.priceSpacing.constant =spacing;
    self.lables = [NSMutableArray arrayWithObjects: self.housLb,self.typeLb,self.directionLb,self.priceLb, self.totalLb, nil];
   
}

- (void)setLittes:(NSArray *)littes{
     self.bottomLine.hidden = YES;
  [self.lables enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
           UILabel * lable = obj;
           lable.text = littes[idx];
       }];
    for (UILabel * lable in self.lables) {
           lable.font = gateFont(12, Medium);
             lable.textColor = gateColor(@"cccccc");
       }
 
}

- (void)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath setLittes:(NSArray *)littes{
    self.indexPath = indexPath;
     self.rowInSection = [tableView numberOfRowsInSection:indexPath.section];
     //分割线 非单组单行 非最后一行

    self.bottomLine.hidden = self.indexPath.row==self.rowInSection-1?NO:YES;
    NSInteger i= 0;
    for (UILabel * lable in self.lables) {
                   lable.font = gateFont(12, Normal);
                   lable.textColor = gateColor(@"42425f");
        if (i == 2) {
             lable.textColor = gateColor(@"65bea1");
        }
        i++;
        
    }
  
}
@end

