//
//  GTChartPMarkerViewTableViewCell.m
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTChartPMarkerViewTableViewCell.h"

@implementation GTChartPMarkerViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.colorView layercornerRadius:5];
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    self.textLb.font = gateFont(11, Normal);
     self.textLb.textColor = [UIColor.whiteColor colorWithAlphaComponent:1];
    self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:1];
}
-(void)setPublicSelectModel:(GatePublicSelectModel *)publicSelectModel{
    if (publicSelectModel.selectEnabled == YES) {
        self.rgithLyout.constant = 5;
        self.leftLyout.constant = 5;
        self.weightLyout.constant = 10;
        self.colorView.hidden = NO;
        self.colorView.backgroundColor = publicSelectModel.color;
    }else{
        self.rgithLyout.constant = 5;
        self.leftLyout.constant = 0;
        self.weightLyout.constant = 0;
         self.colorView.hidden = YES;
    }
    self.textLb.text  = publicSelectModel.titleText;
}

@end
