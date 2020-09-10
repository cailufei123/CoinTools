//
//  NSString+GateAttribute.h
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GateAttribute)
-(NSMutableAttributedString* )getMutableAttributedStringWhitSearchString:(NSString *)rangeStr searchStringColor:(UIColor * )color searchStringFont:(UIFont * )font;
@end

NS_ASSUME_NONNULL_END
