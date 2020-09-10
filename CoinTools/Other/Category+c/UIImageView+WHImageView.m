//
//  UIImageView+WHImageView.m
//  WHCategory
//
//  Created by 吴浩 on 2017/6/7.
//  Copyright © 2017年 remember17. All rights reserved.
//

#import "UIImageView+WHImageView.h"

@implementation UIImageView (WHImageView)

+(instancetype)wh_imageViewWithPNGImage:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageV.frame=frame;
    return imageV;
}
-(void)drawRectCornerRadius{
  
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.frame.size.width] addClip];
    [self drawRect:self.bounds];

    self.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
}
- (UIImage *)circleImage {
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪
    CGContextClip(ctx);
    // 将图片画上去
    [self drawRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
