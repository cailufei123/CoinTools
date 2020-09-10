//
//  UIView+HYDEBottomBorder.h
//  HYDECarelink
//
//  Created by 李莹 on 2018/5/24.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, HydeShadowPath){
       HydeShadowPathTop,
       HydeShadowPathBottom,
       HydeShadowPathLeft,
       HydeShadowPathRight,
       HydeShadowPathCommon,
       HydeShadowPathAround,
};
@interface UIView (HYDEBottomBorder)
@property(nonatomic,assign)HydeShadowPath shadowPathType;
- (void)addBottomBorderWith:(UIColor *)color;

- (void)addTopBorderWith:(UIColor *)color;

- (void)addRoundedCornersWith:(float)cornerRadius;

- (void)addRoundedCornersWith:(float)cornerRadius withBounds:(CGRect)bounds;

- (void)addRoundedCornersWith:(float)cornerRadius withBounds:(CGRect)bounds withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)borderColor;
/**
给UIView添加阴影

@param shadowColor 阴影颜色
@param shadowOpacity 阴影透明度 默认0
@param shadowRadius 阴影半径 也就是阴影放射程度 默认3
@param shadowPathType 阴影方向
@param shadowPathWidth 阴影放射g宽度
*/

//- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(HydeShadowPath)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth viewCornerRadius:(CGFloat)cornerRadius;
@end
