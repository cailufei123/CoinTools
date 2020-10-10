//
//  GateRequestManager.m
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateRequestManager.h"
#import "AFNetworking.h"
@implementation GateRequestManager

+ (void)get:(NSString *)url block:(ResponseBlock)block
{
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];    //如果是需要验证自建证书，需要设置为YES
    
    policy.validatesDomainName = NO;//不验证证书的域名
    
    // 1.获得请求管理者
    AFHTTPSessionManager * mgr = [AFHTTPSessionManager manager];
   mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/text",@"text/plain", @"text/javascript",@"application/x-json",@"text/html", nil];
    
    mgr.requestSerializer.timeoutInterval = 10;
   // mgr.operationQueue.maxConcurrentOperationCount = MaxOperationCountQueue;
    
    // 2.发送GET请求
    [mgr setSecurityPolicy:policy];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
      mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    //添加  请求头
//   block(nil,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
//    [mgr.requestSerializer setValue:@"abcd" forHTTPHeaderField:@"name"];
    [mgr GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = responseObject;
               NSDictionary * JSON =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//               if (success) {
//                   success(JSON);
                     block(nil, JSON);
//               }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error.code != -999 && ![error.localizedDescription containsString:@"已取消"]) {
//                   block(error,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
//        }
           block(error,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
    }];
     
    
}



+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
     mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/text",@"text/plain", @"text/javascript",@"application/x-json",@"text/html", nil];
    

 mgr.requestSerializer.timeoutInterval = 30;
   // mgr.operationQueue.maxConcurrentOperationCount = MaxOperationCountQueue;
    
    [mgr setSecurityPolicy:policy];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //添加  请求头
//    [mgr.requestSerializer setValue:@"abcd" forHTTPHeaderField:@"name"];
    
    // 2.发送POST请求
   NSURLSessionDataTask *task =  [mgr POST:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSData *data = responseObject;
         id JSON =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               if (success) {
                   success(JSON);
               }
               
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}
@end
