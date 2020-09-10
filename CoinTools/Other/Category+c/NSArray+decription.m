//
//  NSArray+decription.m
//  Auction
//
//  Created by 蔡路飞 on 2017/9/18.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "NSArray+decription.h"

@implementation NSArray (decription)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString string];
    // 开头有个[
    [string appendString:@"[\n"];
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    // 结尾有个]
    [string appendString:@"]"];
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
    {
        [string deleteCharactersInRange:range];
    }
    return string;
}

@end
