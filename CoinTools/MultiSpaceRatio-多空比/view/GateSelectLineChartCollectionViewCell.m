//
//  GateSelectLineChartCollectionViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateSelectLineChartCollectionViewCell.h"

@implementation GateSelectLineChartCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLb.font  = gateFont(11, Normal);
    self.nameLb.textColor  = gateColor(@"697ba6");
}
- (void)reloadSelectCell{
    self.selectBt.backgroundColor = [UIColor whiteColor];
}
- (void)reloadUnSelectCell:(UIColor *)color{
    self.selectBt.backgroundColor = color;
}


@end
