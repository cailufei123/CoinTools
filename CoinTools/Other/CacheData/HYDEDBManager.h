//
//  HYDEDBManager.h
//  HYDECarelink
//
//  Created by cailufei on 2018/12/21.
//  Copyright © 2018 liying. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YTKKeyValueStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYDEDBManager : NSObject

///// 更新数据
/////
///// @param data 数据
//
//+ (void)updateHomeData:(NSString *)data whit:(NSString *)name;
//
///// 插入数据
/////
///// @param data 数据
//
//+ (void)insertHomeData:(NSString *)data whit:(NSString *)name;
//
///// 查询数据
//+ (NSArray *)queryHomeData:(NSString *)name;
//
///// 删除数据
/////
//
//+ (void)deleteHomeDataWithPage:(NSString *)name;

+ (void)writeCacheData:(NSDictionary *)cacheData withKey:(NSString *)key;

+(NSDictionary *)getCacheDataWithKey:(NSString *)key;

+ (void)removeCacheDataWithKey:(NSString *)key;




+(NSDictionary *)getBrowseCacheDataWithKey:(NSString *)key;

+ (void)writeBrowseCacheData:(NSDictionary *)cacheData withKey:(NSString *)key;

+ (void)removeBrowseCacheDataWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
