//
//  NSString+GateAttribute.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "NSString+GateAttribute.h"

@implementation NSString (GateAttribute)
-(NSMutableAttributedString* )getMutableAttributedStringWhitSearchString:(NSString *)rangeStr searchStringColor:(UIColor * )color searchStringFont:(UIFont * )font{
    
    if ([rangeStr isNotBlank]) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
        
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                  
                      [paragraphStyle setLineSpacing:2];
//                 [paragraphStyle setAlignment:NSTextAlignmentLeft];
          NSDictionary * attributesDict = @{NSFontAttributeName:font,NSForegroundColorAttributeName:color};
       
      
        NSRange searchRange = [self rangeOfString: rangeStr];
        
        [attributedString addAttributes:attributesDict range:searchRange];
        
          NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle};
         [attributedString addAttributes:dic   range:self.rangeOfAll];
        return attributedString;
    }else{
        return [NSMutableAttributedString new];
    }
   
}
@end
