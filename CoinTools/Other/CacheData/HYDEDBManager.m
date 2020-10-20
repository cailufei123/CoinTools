//
//  HYDEDBManager.m
//  HYDECarelink
//
//  Created by cailufei on 2018/12/21.
//  Copyright © 2018 liying. All rights reserved.
//

#import "HYDEDBManager.h"
#import <FMDB.h>
@implementation HYDEDBManager
//定义一个全局对象
//static FMDatabase *_db;
//
////该方法会在调用该类中方法的时候先调用
//+ (void)initialize{
//    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//
//    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"homeData.db"];
//
//    //1.创建库
//    _db = [FMDatabase databaseWithPath:dbFilePath];
//
//    //2.打开连接
//    BOOL result = [_db open];
//
//    if (result) {
//        //3.创建表
//        /**
//         如果是创建表,新增数据,修改数据,删除数据,我们都一个方法
//         executeUpdate
//         如果是查询executeQuery
//         */
////        BOOL result2 = [_db executeUpdate:@"create table if not exists t_home(id integer primary key,banner text not null,munsList text not null,noti text not null,hospitalList text not null,hospitalsub text not null,doctor text not null,bestDoctor text not null,articleCategory text not null,article text not null,page integer not null);"];
//         BOOL result2 = [_db executeUpdate:@"create table if not exists t_home(id integer primary key,data text not null,name text not null);"];
//        if (result2) {
//            NSLog(@"创建表成功!!!");
//        }
//    }
//
//}
//
//
////添加数据
//+ (void)insertHomeData:(NSString *)data whit:(NSString *)name{
//    [_db executeUpdateWithFormat:@"insert into t_home(data,name) values(%@,%@)",data,name];
//}
//
////更新数据
//+ (void)updateHomeData:(NSString *)data whit:(NSString *)name{
//    [_db executeUpdateWithFormat:@"update t_home set data=%@,name =%@",data,name];
//}
//
////删除数据
//+ (void)deleteHomeDataWithPage:(NSString *)name{
//    [_db executeUpdateWithFormat:@"delete from t_home where name = %@",name];
//}
////查询数据
//+  (NSArray *)queryHomeData:(NSString *)name{
//
////    FMResultSet *resultSet = [_db executeQuery:[NSString stringWithFormat:@"select * from t_home"]];
//    // 如果你想查询某个字段可以这么写(注意%号的个数)
////        FMResultSet *resultSet = [_db executeQuery:[NSString stringWithFormat:@"select * from t_home where name LIKE '%%%@%%'",zhangsan]];
//    FMResultSet *resultSet = [_db executeQuery:@"select * from t_home where name = ?",name];
//    NSMutableArray *homeDatas = [NSMutableArray array];
//
//    while (resultSet.next) {
//        NSString *homeData = [resultSet stringForColumn:@"data"];
//        // 将字符串转换成对象(下面会说为什么存字符串!!!)
//        NSData *data = [homeData dataUsingEncoding:NSUTF8StringEncoding];
//        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
//        //将其添加到数组中
//        [homeDatas addObject:array];
//    }
//
//    return homeDatas.copy;
//}


+(NSDictionary *)getCacheDataWithKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"pageCache.db"];
    NSString *tableName = @"cache";
    NSDictionary *cacheData = [store getObjectById:key fromTable:tableName];
    [store close];
    store = nil;
    return cacheData;
}

+ (void)writeCacheData:(NSDictionary *)cacheData withKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"pageCache.db"];
    NSString *tableName = @"cache";
    [store createTableWithName:tableName];
    [store putObject:cacheData withId:key intoTable:tableName];
    [store close];
    store = nil;
}

+ (void)removeCacheDataWithKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"pageCache.db"];
    NSString *tableName = @"cache";
    [store deleteObjectById:key fromTable:tableName];
    [store close];
    store = nil;

}



+(NSDictionary *)getBrowseCacheDataWithKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"browseCache.db"];
    NSString *tableName = @"browseCache";
    NSDictionary *cacheData = [store getObjectById:key fromTable:tableName];
    [store close];
    store = nil;
    return cacheData;
}

+ (void)writeBrowseCacheData:(NSDictionary *)cacheData withKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"browseCache.db"];
    NSString *tableName = @"browseCache";
    [store createTableWithName:tableName];
    [store putObject:cacheData withId:key intoTable:tableName];
    [store close];
    store = nil;
}

+ (void)removeBrowseCacheDataWithKey:(NSString *)key{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"browseCache.db"];
    NSString *tableName = @"browseCache";
    [store deleteObjectById:key fromTable:tableName];
    [store close];
    store = nil;
    
}


@end
