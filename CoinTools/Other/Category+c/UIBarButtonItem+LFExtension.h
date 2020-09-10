//
//  UIBarButtonItem+LFExtension.h
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LFExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (instancetype)itemWithText:(NSString *)text  target:(id)target action:(SEL)action;
+ (instancetype)itemWithImage:(NSString *)image selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;

/**新增导航按钮
 *  image       导航图片
 *  imageSize   图片宽高
 *  selectImage 点击图片
 *  action      方法
 */
+ (instancetype)wby_itemWithImage:(NSString *)image imageSize:(CGSize)imageSize selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;
@end
