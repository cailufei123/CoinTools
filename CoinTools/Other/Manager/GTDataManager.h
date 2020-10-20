//
//  GTDataManager.h
//  CoinTools
//
//  Created by MAC on 2020/10/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDataManager : NSObject
+(NSArray<GTHomeTitleModel* > *)getItemModelWhit:(NSArray *)tempArr;
+(NSString*)getLanguageData:(NSString*)titleStr;



@end

NS_ASSUME_NONNULL_END
