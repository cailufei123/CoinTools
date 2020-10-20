//
//  GateRequestManager.h
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ResponseBlock)(NSError *error, NSDictionary *response);
typedef void(^ResponseCacheBlock)(NSError *error,BOOL isCache, NSDictionary *response);
@interface GateRequestManager : NSObject<NSURLConnectionDelegate>
+(void)get:(NSString *)url  block:(ResponseBlock)block;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError * failure))failure;
+ (void)getCache:(NSString *)url block:(ResponseCacheBlock)block;
@end

NS_ASSUME_NONNULL_END
