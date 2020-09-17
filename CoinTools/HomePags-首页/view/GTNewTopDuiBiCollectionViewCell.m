//
//  GTNewTopDuiBiCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTNewTopDuiBiCollectionViewCell.h"

@implementation GTNewTopDuiBiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLb.textColor = self.duibiLb.textColor  =  gateColor(@"333B46");
    self.titleLb.font = self.duibiLb.font = gateFont(11, Normal);
    self.titleLb.font = gateFont(12, Medium);
    
     self.lineProgressView.layer.cornerRadius = 3;
      self.lineProgressView.lineWidth = 0.0;
      self.lineProgressView.lineColor = [UIColor redColor];
      self.lineProgressView.progressColor = gateColor(@"3790eb");
      self.lineProgressView.defaultColor = gateColor(@"ff0400");;
      self.lineProgressView.label.textColor = [UIColor greenColor];
      self.lineProgressView.label.hidden = YES;
      self.lineProgressView.animationText = YES;
      [self.lineProgressView initializeProgress];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          double val = ((double)arc4random() / UINT32_MAX);
          self.lineProgressView.progress =  val;
         
      });
//      self.lineProgressView.progress = 0.6;
}
@end
