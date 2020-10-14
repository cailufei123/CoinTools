//
//  GTTopTableViewTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTTopTableViewTableViewCell.h"

@implementation GTTopTableViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.ratioLb.font = self.top5Lb.font = gateFont(12, Normal);
  
}



@end
