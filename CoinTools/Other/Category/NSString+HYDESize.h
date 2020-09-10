//
//  NSString+HYDESize.h
//  HYDE114Health
//
//  Created by 李莹 on 2018/4/2.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HYDESize)

- (CGFloat)getTheSizeWidthWithFont:(UIFont*)font WithHeight:(float)height;

- (CGFloat)getTheSizeHeightWithFont:(UIFont*)font WithWidth:(float)width;
@end
