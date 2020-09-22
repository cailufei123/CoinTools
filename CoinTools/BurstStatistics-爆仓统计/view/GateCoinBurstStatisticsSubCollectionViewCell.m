
//  GateCoinBurstStatisticsSubCollectionViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateCoinBurstStatisticsSubCollectionViewCell.h"

@implementation GateCoinBurstStatisticsSubCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLb.font = gateFont(12, Medium);
    self.moneyLb.font = gateFont(16, Medium);
    self.matchMoneyLb.font = gateFont(12, Normal);
  
}

@end
