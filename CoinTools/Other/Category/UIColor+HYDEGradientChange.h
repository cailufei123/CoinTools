//
//  UIColor+HYDEGradientChange.h
//  HYDEZhuYi
//
//  Created by 李莹 on 2019/5/29.
//  Copyright © 2019 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 渐变方式
 
 - HYDEGradientChangeDirectionLevel:              水平渐变
 - HYDEGradientChangeDirectionVertical:           竖直渐变
 - HYDEGradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
 - HYDEGradientChangeDirectionDownDiagonalLine:   向上对角线渐变
 */
typedef NS_ENUM(NSInteger, HYDEGradientChangeDirection) {
    HYDEGradientChangeDirectionLevel,
    HYDEGradientChangeDirectionVertical,
    HYDEGradientChangeDirectionUpwardDiagonalLine,
    HYDEGradientChangeDirectionDownDiagonalLine,
};

@interface UIColor (HYDEGradientChange)

/**
 创建渐变颜色
 
 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色
 
 @return 创建的渐变颜色
 */
+ (instancetype)colorGradientChangeWithSize:(CGSize)size
                                     direction:(HYDEGradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;


// 其他曲线渐变暂不考虑

@end

NS_ASSUME_NONNULL_END
