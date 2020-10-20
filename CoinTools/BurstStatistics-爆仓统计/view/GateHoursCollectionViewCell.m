//
//  GateHoursCollectionViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHoursCollectionViewCell.h"
@interface GateHoursCollectionViewCell()

@property(nonatomic,strong) CAShapeLayer * shapeLayer ;

@end

@implementation GateHoursCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLb.font  = [UIFont normalFontOfSize:13 WithFontType:Normal];
    self.titleLb.textColor = gateWhiteColor;
    self.titleLb.text = @"1小时爆仓";
    self.bagView.cornerRadius = 3;
    self.titleView.layer.mask = [self creatBezierPathlastColor:[UIColor redColor]];
    self.moneyLb.textColor = gateTextLableOrangeColor;
      self.moneyLb.text = @"$505万";
    self.moneyLb.font = gateFont(25, Bold);
    self.machMoneyLb.textColor = gateColor(@"696f9c");
      self.machMoneyLb.text = @"$3456万";
    self.machMoneyLb.font = gateFont(15, NO);
}
-(CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}
-(CAShapeLayer *)creatBezierPathlastColor:(UIColor * )firstColor{
    
 
    
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [ path1 moveToPoint:CGPointMake(0, 0)];
    [ path1 addLineToPoint:CGPointMake(100, 0)];
      [ path1 addLineToPoint:CGPointMake(86, 16)];
    [ path1 addLineToPoint:CGPointMake(80, 20)];
   
    [path1 addLineToPoint:CGPointMake(0, 20)];
    [ path1 closePath];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [firstColor colorWithAlphaComponent:1].CGColor;
    self.shapeLayer.path =  path1.CGPath;
    
   
   
    return self.shapeLayer;
}
@end
