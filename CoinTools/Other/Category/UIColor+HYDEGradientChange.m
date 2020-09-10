//
//  UIColor+HYDEGradientChange.m
//  HYDEZhuYi
//
//  Created by 李莹 on 2019/5/29.
//  Copyright © 2019 liying. All rights reserved.
//

#import "UIColor+HYDEGradientChange.h"

@implementation UIColor (HYDEGradientChange)

+ (instancetype)colorGradientChangeWithSize:(CGSize)size
                                     direction:(HYDEGradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor {
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !startcolor || !endColor) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    
    CGPoint startPoint = CGPointZero;
    if (direction == HYDEGradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    gradientLayer.startPoint = startPoint;
    
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case HYDEGradientChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case HYDEGradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case HYDEGradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case HYDEGradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    gradientLayer.endPoint = endPoint;
    
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}
@end
