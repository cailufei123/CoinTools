//
//  UIView+CLFExtension.h
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CLFExtension)
@property (nonatomic, assign) CGSize clf_size;
@property (nonatomic, assign) CGFloat clf_width;
@property (nonatomic, assign) CGFloat clf_height;
@property (nonatomic, assign) CGFloat clf_x;
@property (nonatomic, assign) CGFloat clf_y;
@property (nonatomic, assign) CGFloat clf_centerX;
@property (nonatomic, assign) CGFloat clf_centerY;

@property (nonatomic, assign) CGFloat clf_right;
@property (nonatomic, assign) CGFloat clf_bottom;

+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;

- (void)layercornerRadius:(CGFloat)value;
/**从左到右渐变色*/
-(void)gradientFrame:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor;
/**从上到下渐变色*/
-(void)gradientFrameUpDown:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor;
/**自定义阴影面积
 *paintingWidth 控件的宽度
 *paintingHeight 控件的高度
 *阴影的宽度    X
 *阴影的高度    Y
 *阴影的颜色    layerColor
 *shadowOpacity 透明度  0.1f-1.0f
 *shadowRadius  圆角度数  
 *shadowOffset  偏移量
 */

-(void)wby_setShadowOffsetWithPaintingWidth:(CGFloat)paintingWidth paintingHeight:(CGFloat)paintingHeight  X:(CGFloat )X Y:(CGFloat)Y layerColor:(UIColor*)layerColor  shadowOpacity:(CGFloat)shadowOpacity  shadowRadius:(CGFloat)shadowRadius  shadowOffset:(CGSize)shadowOffset;

@end
