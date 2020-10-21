//
//  GTGTDuoKongSelectTimeTopViewCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTGTDuoKongSelectTimeTopViewCollectionViewCell.h"

@implementation GTGTDuoKongSelectTimeTopViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLb.font = gateFont(12, Normal);
    self.titleLb.textColor = gateColor(@"333333");
}

@end
