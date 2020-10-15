//
//  GTDataManager.m
//  CoinTools
//
//  Created by MAC on 2020/10/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTDataManager.h"

@implementation GTDataManager
+(NSArray<GTHomeTitleModel* > *)getItemModelWhit:(NSArray *)tempArr{
   
    return [NSArray modelArrayWithClass:[GTHomeTitleModel class] json:tempArr];
}
+(NSString*)getLanguageData:(NSString*)titleStr{
    NSDictionary * dict =  [GTCurrencyTool readLocalFileWithName:@"CoinTools.framework/languageData"];
    
    NSString * languageStr =  dict[@"Chinese"][titleStr];
    
    return languageStr;
}
@end
