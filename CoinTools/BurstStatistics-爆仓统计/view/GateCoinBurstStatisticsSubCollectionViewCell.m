
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
    self.nameLb.font = gateFont(14, Medium);
    self.moneyLb.font = gateFont(20, Medium);
    self.matchMoneyLb.font = gateFont(14, Normal);
    
    self.nameLb.text = @"BTC";
       self.moneyLb.text = @"$2284万";
       self.matchMoneyLb.text = @"2237个BTC";
}

@end
