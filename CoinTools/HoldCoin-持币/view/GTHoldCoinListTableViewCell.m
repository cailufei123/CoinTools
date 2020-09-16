//
//  GTHoldCoinListTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHoldCoinListTableViewCell.h"

@implementation GTHoldCoinListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.chibiLb.font =  self.chicangLb.font =  self.day7.font = self.chackBt.font = gateFont(14, Normal);

}

@end
