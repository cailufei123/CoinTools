//
//  GTTopTotalTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTTopTotalTableViewCell.h"
@implementation GTTopTotalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.lineProgressView.layer.cornerRadius = 10;
     self.lineProgressView.lineWidth = 0.0;
     self.lineProgressView.lineColor = [UIColor redColor];
     self.lineProgressView.progressColor = gateColor(@"549aef");
     self.lineProgressView.defaultColor = gateColor(@"e04d5a");;
     self.lineProgressView.label.textColor = [UIColor greenColor];
     self.lineProgressView.label.hidden = YES;
     self.lineProgressView.animationText = YES;
     [self.lineProgressView initializeProgress];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.lineProgressView.progress = 0.7;
    });
   
    
    self.kongLb.textColor = self.duoLb.textColor = gateColor(@"989898");
    self.duoLb.font = gateFont(13, Medium);
    self.kongLb.font = gateFont(13, Medium);
    
    NSMutableAttributedString * attr = [@"多 54.69%" getMutableAttributedStringWhitSearchString:@"54.69%" searchStringColor:gateColor(@"ec5d76") searchStringFont:gateFont(16, Medium)];
    self.kongLb.attributedText = attr;
     self.duoLb.attributedText = attr;
    
}



@end
