//
//  UIView+HYDEBottomBorder.m
//  HYDECarelink
//
//  Created by 李莹 on 2018/5/24.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIView+HYDEBottomBorder.h"

@implementation UIView (HYDEBottomBorder)

- (void)addBottomBorderWith:(UIColor *)color{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(self.frame)-1.0f, CGRectGetWidth(self.frame), 1.0f);
    bottomBorder.backgroundColor = color.CGColor;
    [self.layer addSublayer:bottomBorder];
}

- (void)addTopBorderWith:(UIColor *)color{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, 0, CGRectGetWidth(self.frame), 1.0f);
    bottomBorder.backgroundColor = color.CGColor;
    [self.layer addSublayer:bottomBorder];
}


- (void)addRoundedCornersWith:(float)cornerRadius{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.layer.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

- (void)addRoundedCornersWith:(float)cornerRadius withBounds:(CGRect)bounds{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

- (void)addRoundedCornersWith:(float)cornerRadius withBounds:(CGRect)bounds withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)borderColor {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    [self addRoundedCornersWith:cornerRadius withBounds:bounds];
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.path = path.CGPath;
    maskLayer.fillColor  = [UIColor clearColor].CGColor;
    maskLayer.strokeColor = borderColor.CGColor;
    maskLayer.lineWidth = borderWidth;
    maskLayer.frame = bounds;
    [self.layer addSublayer: maskLayer];
}
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(HydeShadowPath)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth viewCornerRadius:(CGFloat)cornerRadius{

    self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
    self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
    self.layer.shadowOpacity = shadowOpacity;// 阴影透明度，默认0
    self.layer.shadowOffset = CGSizeZero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    self.layer.cornerRadius = cornerRadius;//阴影半径，默认3
    CGRect shadowRect = CGRectZero;
    CGFloat originX,originY,sizeWith,sizeHeight;
    originX = 0;
    originY = 0;
    sizeWith = self.bounds.size.width;
    sizeHeight = self.bounds.size.height;

    if (shadowPathType == HydeShadowPathTop) {
        shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == HydeShadowPathBottom){
        shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == HydeShadowPathLeft){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == HydeShadowPathRight){
        shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == HydeShadowPathCommon){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, 2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);
    }else if (shadowPathType == HydeShadowPathAround){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
    }
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = bezierPath.CGPath;//阴影路径
}
@end
