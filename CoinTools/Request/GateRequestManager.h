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
@interface GateRequestManager : NSObject
+(void)get:(NSString *)url  block:(ResponseBlock)block;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError * failure))failure;
@end

NS_ASSUME_NONNULL_END
