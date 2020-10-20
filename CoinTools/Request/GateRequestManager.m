//
//  GateRequestManager.m
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateRequestManager.h"
#import "AFNetworking.h"
#import "HYDEDBManager.h"
@implementation GateRequestManager

+ (void)get:(NSString *)url block:(ResponseBlock)block
{
    
//    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
//
//                                                diskCapacity:20 * 1024 * 1024 diskPath:nil];
//
//    [NSURLCache setSharedURLCache:URLCache];    //设置共享缓存容器
    
    [[AFHTTPSessionManager manager].tasks makeObjectsPerformSelector:@selector(cancel)];
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];    //如果是需要验证自建证书，需要设置为YES
    policy.validatesDomainName = NO;//不验证证书的域名
  
    
    // 1.获得请求管理者
    AFHTTPSessionManager * mgr = [AFHTTPSessionManager manager];
   mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/text",@"text/plain", @"text/javascript",@"application/x-json",@"text/html", nil];
    
//    mgr.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    mgr.requestSerializer.timeoutInterval = 10;
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:150 * 1024 * 1024 diskPath:@"com.alamofire.imagedownloader"];

    [NSURLCache setSharedURLCache:cache];
    mgr.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
   // mgr.operationQueue.maxConcurrentOperationCount = MaxOperationCountQueue;
   
    // 2.发送GET请求
    [mgr setSecurityPolicy:policy];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//      mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    //添加  请求头
//   block(nil,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
//    [mgr.requestSerializer setValue:@"abcd" forHTTPHeaderField:@"name"];

    
    NSURLSessionConfiguration *confi = [NSURLSessionConfiguration defaultSessionConfiguration];

    confi.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;

    [NSURLSession sessionWithConfiguration:confi delegate:[[self alloc]init]

                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask* task =   [mgr GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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




+ (void)getCache:(NSString *)url block:(ResponseCacheBlock)block
{
    
//    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
//
//                                                diskCapacity:20 * 1024 * 1024 diskPath:nil];
//
//    [NSURLCache setSharedURLCache:URLCache];    //设置共享缓存容器
    
    
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];    //如果是需要验证自建证书，需要设置为YES
    policy.validatesDomainName = NO;//不验证证书的域名
  
    NSString *cacheKey = [self getCacheKey:url withParams:nil];
    NSDictionary *cacheData = [self getCacheDataWith:cacheKey];
    if (cacheData) {
        !block ? : block(nil, YES, cacheData);
    }
    // 1.获得请求管理者
    AFHTTPSessionManager * mgr = [AFHTTPSessionManager manager];
   mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/text",@"text/plain", @"text/javascript",@"application/x-json",@"text/html", nil];
    
//    mgr.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    mgr.requestSerializer.timeoutInterval = 10;
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:150 * 1024 * 1024 diskPath:@"com.alamofire.imagedownloader"];

    [NSURLCache setSharedURLCache:cache];
    mgr.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
   // mgr.operationQueue.maxConcurrentOperationCount = MaxOperationCountQueue;
   
    // 2.发送GET请求
    [mgr setSecurityPolicy:policy];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//      mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    //添加  请求头
//   block(nil,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
//    [mgr.requestSerializer setValue:@"abcd" forHTTPHeaderField:@"name"];

    
    NSURLSessionConfiguration *confi = [NSURLSessionConfiguration defaultSessionConfiguration];

    confi.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;

    [NSURLSession sessionWithConfiguration:confi delegate:[[self alloc]init]

                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    [mgr GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = responseObject;
               NSDictionary * JSON =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [self setCacheDataWithKey:cacheKey withCacheData:JSON];
//               if (success) {
//                   success(JSON);
                     block(nil,NO, JSON);
//               }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error.code != -999 && ![error.localizedDescription containsString:@"已取消"]) {
//                   block(error,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
//        }
        
        block(error,NO,@{@"msg":@"网络连接失败！",@"code":@"-9999"});
        [EasyTextView showText:@"网络错误" config:^EasyTextConfig *{
            EasyTextConfig *config = [EasyTextConfig shared];
            config.bgColor = [[UIColor blackColor]colorWithAlphaComponent:0.8] ;
            config.shadowColor = [UIColor clearColor] ;
            config.animationType = TextAnimationTypeFade;
            config.statusType = TextStatusTypeBottom ;
            config.titleColor = [UIColor whiteColor];
            
            config.statusType = TextStatusTypeMidden;
            return config ;
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [EasyLodingView hidenLoding];
        });
    }];
    
   
}





-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask

    willCacheResponse:(NSCachedURLResponse *)proposedResponse

    completionHandler:(void (^)(NSCachedURLResponse *cachedResponse))completionHandler {

 

    //这里可以修改HTTP的缓存字段

    NSURLResponse *response = proposedResponse.response;

    NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse*)response;

    NSDictionary *headers = HTTPResponse.allHeaderFields;

    NSCachedURLResponse *cachedResponse;

    //修改Cache-Control字段的值

    NSMutableDictionary *modifiedHeaders = headers.mutableCopy;

    [modifiedHeaders setObject:@"max-age=10" forKey:@"Cache-Control"];

    NSHTTPURLResponse * modifiedResponse;

    modifiedResponse = [[NSHTTPURLResponse alloc] initWithURL:HTTPResponse.URL

                            statusCode:HTTPResponse.statusCode HTTPVersion:@"HTTP/1.1"

                            headerFields:modifiedHeaders];

    cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:modifiedResponse

                            data:proposedResponse.data

                            userInfo:proposedResponse.userInfo

                            storagePolicy:proposedResponse.storagePolicy];

 

    completionHandler(cachedResponse);   //返回nil则表示不缓存响应

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





+ (NSString *)getCacheKey:(NSString *)url withParams:(NSDictionary *)params{
    if (params && [params.allKeys containsObject:@"page"]) {
        if ([params[@"page"] intValue] == 1) {
            NSString *key = [NSString stringWithFormat:@"%@%@",url,params?[params jsonStringEncoded]:@""];
            return [key md5String];
        }
        else{
            return nil;
        }
    }
    else{
        NSString *key = [NSString stringWithFormat:@"%@%@",url,params?[params jsonStringEncoded]:@""];
        return [key md5String];
    }
}

+ (void)setCacheDataWithKey:(NSString *)key withCacheData:(NSDictionary *)cacheData{
    if (key) {
        [HYDEDBManager writeCacheData:cacheData withKey:key];
    }
}

+ (NSDictionary *)getCacheDataWith:(NSString *)key{
    if (key) {
        return [HYDEDBManager getCacheDataWithKey:key];
    }
    return nil;
}

@end
