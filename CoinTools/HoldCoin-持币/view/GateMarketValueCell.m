//
//  GateMarketValueCell.m
//  block-pro
//
//  Created by MAC on 2020/9/7.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateMarketValueCell.h"

@implementation GateMarketValueCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{
            
            self.highlightView.hidden=YES;
        }];
       
    });

}

-(void)layoutSubviews{
     [super layoutSubviews];
    [self.contentView setNeedsLayout];
      [self.contentView layoutIfNeeded];
//    self.highlightView.backgroundColor = [UIColor colorGradientChangeWithSize: self.highlightView.clf_size direction:HYDEGradientChangeDirectionLevel startColor:[UIColor.whiteColor colorWithAlphaComponent:0.0] endColor:[UIColor.redColor colorWithAlphaComponent:0.4]];
}

@end
