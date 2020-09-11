//
//  GateWholeNetworkBigOrderStatisticsCollectionCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateWholeNetworkBigOrderStatisticsCollectionCell.h"
@interface GateWholeNetworkBigOrderStatisticsCollectionCell()



@end
@implementation GateWholeNetworkBigOrderStatisticsCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
      self.titleLb.text = @"1小时爆仓";
    self.titleLb.font  = [UIFont normalFontOfSize:13 WithFontType:Normal];
    self.titleLb.textColor = gateColor(@"ffffff");
      
    self.totalMoneyLb.font  = [UIFont normalFontOfSize:16 WithFontType:Bold];
       self.totalMoneyLb.textColor = gateColor(@"283862");
    
    self.buyLb.font  = [UIFont normalFontOfSize:14 WithFontType:Normal];
         self.buyLb.textColor = gateColor(@"697ba8");
    
      self.sellLb.font  = [UIFont normalFontOfSize:14 WithFontType:Normal];
              self.buyLb.textColor = gateColor(@"697ba8");
           
    
        self.titleBgView.layer.borderColor = [UIColor purpleColor].CGColor;
    self.titleBgView.backgroundColor = [UIColor purpleColor];
    self.titleBgView.layer.mask = [self creatBezierPathlastColor:[UIColor grayColor]];
    NSString * sellMoney = @"买：$100万"; NSString * buyMoney = @"卖：$1000万";

    

    
    self.buyLb.attributedText =   [buyMoney getMutableAttributedStringWhitSearchString:@"卖" searchStringColor:gateColor(@"f25674") searchStringFont:gateFont(14, Normal)];
      self.sellLb.attributedText =  [sellMoney getMutableAttributedStringWhitSearchString:@"买" searchStringColor:gateColor(@"02c69d") searchStringFont:gateFont(14, Normal)];
}
-(CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}
-(CAShapeLayer *)creatBezierPathlastColor:(UIColor * )firstColor{
    
 
    
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    path1.lineWidth = 5;
    [ path1 moveToPoint:CGPointMake(0, 0)];
    [ path1 addLineToPoint:CGPointMake(80, 0)];
      [ path1 addLineToPoint:CGPointMake(66, 16)];
    [ path1 addLineToPoint:CGPointMake(60, 20)];
   
    [path1 addLineToPoint:CGPointMake(0, 20)];
    [ path1 closePath];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [firstColor colorWithAlphaComponent:1].CGColor;
    self.shapeLayer.path =  path1.CGPath;
    
   
   
    return self.shapeLayer;
}
@end
