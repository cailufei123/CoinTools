//
//  GTHeYueMessageCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/13.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHeYueMessageCollectionViewCell.h"

@implementation GTHeYueMessageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLb.font = gateFont(12, Normal);
    self.titleLb.textColor = gateColor(@"47535e");
    self.ratioLb.font = gateFont(14, Normal);
   self.ratioLb.textColor = gateColor(@"5a78ed");
    [self layercornerRadius:3];
    self.backgroundColor =gateColor(@"f3f7fd");
}

@end
