//
//  NSArray+NilSafe.m
//  NilDictionaryTest
//
//  Created by 张张凯 on 2018/2/1.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "NSArray+NilSafe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"//在NSString类别中交换方法
/*
 __FUNCTION__    输出当前方法
 */

@implementation NSArray (NilSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      
        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(emptyArray_objectAtIndex:)];
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(arrayI_objectAtIndex:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(arrayM_objectAtIndex:)];
        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(singleObjectArrayI_objectAtIndex:)];
        
        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(emptyArray_objectAtIndexedSubscript:)];
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(arrayI_objectAtIndexedSubscript:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(arrayM_objectAtIndexedSubscript:)];
        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(singleObjectArrayI_objectAtIndexedSubscript:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObject:) withSwizzledSelector:@selector(safeAddObject:)];
        
        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(removeAllObjects) withSwizzledSelector:@selector(singleObjectArrayI_removeAllObjects)];
//         [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObjectsFromArray:) withSwizzledSelector:@selector(arrayM_addObjectsFromArray:)];
        
//        swizzling_exchangeMethod(objc_getClass("__NSArray0"), @selector(objectAtIndex:), @selector(emptyArray_objectAtIndex:));
//        swizzling_exchangeMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:), @selector(arrayI_objectAtIndex:));
//        swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:), @selector(arrayM_objectAtIndex:));
//        swizzling_exchangeMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndex:), @selector(singleObjectArrayI_objectAtIndex:));
//
//        swizzling_exchangeMethod(objc_getClass("__NSArray0"), @selector(objectAtIndexedSubscript:), @selector(emptyArray_objectAtIndexedSubscript:));
//        swizzling_exchangeMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:), @selector(arrayI_objectAtIndexedSubscript:));
//        swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:), @selector(arrayM_objectAtIndexedSubscript:));
//        swizzling_exchangeMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndex:), @selector(singleObjectArrayI_objectAtIndexedSubscript:));

        
    });
}

//
//#endif
//
//- (id)arrayM_addObjectsFromArray:(id)otherArray{
//    if(otherArray)

//    if ([otherArray isKindOfClass:objc_getClass("__NSArrayM")]) {
//         return [self arrayM_addObjectsFromArray:otherArray];
//    }else{
//        return nil;
//    }
//    if (![otherArray isKindOfClass: [NSArray class]]) {
//        return nil;
//    }else{
//
//    }
   
//}


#pragma MARK -  - (id)objectAtIndex:
- (id)emptyArray_objectAtIndex:(NSUInteger)index{
    return nil;
}

- (id)arrayI_objectAtIndex:(NSUInteger)index{
    if(index < self.count){
        return [self arrayI_objectAtIndex:index];
    }
    return nil;
}

- (id)arrayM_objectAtIndex:(NSUInteger)index{
    if(index < self.count){
        return [self arrayM_objectAtIndex:index];
    }
    return nil;
}

- (id)singleObjectArrayI_objectAtIndex:(NSUInteger)index{
    if(index < self.count){
        return [self singleObjectArrayI_objectAtIndex:index];
    }
    return nil;
}

#pragma MARK -  - (id)objectAtIndexedSubscript:
- (id)emptyArray_objectAtIndexedSubscript:(NSUInteger)index{
    return nil;
}

- (id)arrayI_objectAtIndexedSubscript:(NSUInteger)index{
    if(index < self.count){
        return [self arrayI_objectAtIndex:index];
    }
    return nil;
}

- (id)arrayM_objectAtIndexedSubscript:(NSUInteger)index{
    if(index < self.count){
        return [self arrayM_objectAtIndex:index];
    }
    return nil;
}

- (id)singleObjectArrayI_objectAtIndexedSubscript:(NSUInteger)index{
    if(index < self.count){
        return [self singleObjectArrayI_objectAtIndexedSubscript:index];
    }
    return nil;
}
- (void)safeAddObject:(id)obj {
    if (obj == nil) {
        NSLog(@"%s can add nil object into NSMutableArray", __FUNCTION__);
    } else {
        [self safeAddObject:obj];
    }
}

-(void)singleObjectArrayI_removeAllObjects{
    
}

//
//+ (void)load{
//    static dispatch_once_t onceToken;
//    //调用原方法以及新方法进行交换，处理崩溃问题。
//    dispatch_once(&onceToken, ^{
//
//
//        /** 不可变数组 */
//        //空
//        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(emptyObjectAtIndex:)];
//        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(emptyObjectAtIndexSubscript:)];
//
//        //非空
//        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(anyObjectAtIndex:)];
//        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(anyObjectAtIndexSubscript:)];
//
//        /** 只有一个元素 */
//        //数组中只有一个元素
//        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(singleObjectIndex:)];
//        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(singleObjectIndexSubscript:)];
//
//        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(insertObject:atIndex:) withSwizzledSelector:@selector(singleInsertObject:atIndex:)];
//        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(addObject:) withSwizzledSelector:@selector(singleAddObject:)];
//
//        /** 类方法创建的数组,插入空时,下面这两个会崩溃 */
//        [objc_getClass("__NSPlaceholderArray") swizzleSelector:@selector(initWithObjects:count:) withSwizzledSelector:@selector(swizzInitWithObjects:count:)];
//    });
//}
//
//
//#pragma mark - 不可变
///**
// 空:nil 或 count = 0
// */
//- (id)emptyObjectAtIndex:(NSInteger)index{
//    NSLog(@"数组 = nil 或者 count = 0 返回 nil %s",__FUNCTION__);
//    return nil;
//}
//
//- (id)emptyObjectAtIndexSubscript:(NSInteger)index{
//    NSLog(@"数组 = nil 或者 count = 0 返回 nil %s",__FUNCTION__);
//    return nil;
//}
//
//
///**
// 多个元素
// */
//- (id)anyObjectAtIndex:(NSInteger)index{
//    if (index >= self.count || index < 0) {
//        NSLog(@"取值时: 索引越界,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    id obj = [self anyObjectAtIndex:index];
//    if ([obj isKindOfClass:[NSNull class]]) {
//        NSLog(@"取值时: 取出的元素类型为 NSNull 类型,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    return obj;
//}
//
//- (id)anyObjectAtIndexSubscript:(NSUInteger)index{
//    if (index >= self.count || index < 0) {
//        NSLog(@"取值时: 索引越界,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    id obj = [self anyObjectAtIndexSubscript:index];
//    if ([obj isKindOfClass:[NSNull class]]) {
//        NSLog(@"取值时: 取出的元素类型为 NSNull 类型,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    return obj;
//}
//
//#pragma mark - 两个类方法引起的崩溃
///**
// arrayWithObject
// arrayWithObjects:nil count:1
// */
//-(id)swizzInitWithObjects:(const id [])objects count:(NSUInteger)cnt{
//    for (int i=0; i<cnt; i++) {
//        if (objects == NULL){
//            NSLog(@"objects 为 NULL, 返回 nil %s",__FUNCTION__);
//            return nil;
//        }
//        if (objects[i] == nil){
//            NSLog(@"取值时: 取出的元素为 nil, 返回 nil %s",__FUNCTION__);
//            return nil;
//        }
//    }
//    return [self swizzInitWithObjects:objects count:cnt];
//}
//
//#pragma mark - 数组中只有一个元素时三个方法不分可变和不可变
///**
// 取值
// */
//- (id)singleObjectIndex:(NSInteger)index{
//    if (index >= self.count || index < 0) {
//        NSLog(@"数组中只有一个元素, 取值时: 索引越界, 返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    id obj = [self singleObjectIndex:index];
//    if ([obj isKindOfClass:[NSNull class]]) {
//        NSLog(@"数组中只有一个元素, 取值时: 元素类型为 NSNull 类型, 返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    return obj;
//}
//
//- (id)singleObjectIndexSubscript:(NSUInteger)index{
//    if (index >= self.count || index < 0) {
//        NSLog(@"取值时: 索引越界,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    id obj = [self singleObjectIndexSubscript:index];
//    if ([obj isKindOfClass:[NSNull class]]) {
//        NSLog(@"取值时: 取出的元素类型为 NSNull 类型,返回 nil %s",__FUNCTION__);
//        return nil;
//    }
//    return obj;
//}
//
///**
// 插入
// */
//- (void)singleInsertObject:(id)object atIndex:(NSUInteger)index{
//    if (object) {
//        [self singleInsertObject:object atIndex:index];
//    }else{
//        //数组中有一个元素时,判断下真实类型,如果是NSArray,则不添加
//        Class superClass = self.superclass;
//        NSString *superClassStr = NSStringFromClass(superClass);
//        if (![superClassStr isEqualToString:@"NSArray"]) {
//            NSLog(@"数组中只有一个元素, 并且数组真实类型为NSMutableArray 插入值: 元素类型为 nil, %s",__FUNCTION__);
//            [self singleInsertObject:[NSNull null] atIndex:index];
//        }else{
//            NSLog(@"真实类型是NSArray,什么都不做 %s",__FUNCTION__);
//        }
//    }
//}
//
//-(void)singleAddObject:(id)object{
//    if (object) {
//        [self singleAddObject:object];
//    }else{
//        //数组中有一个元素时,判断下真实类型,如果是NSArray,则不添加
//        Class superClass = self.superclass;
//        NSString *superClassStr = NSStringFromClass(superClass);
//        if (![superClassStr isEqualToString:@"NSArray"]) {
//            NSLog(@"数组中只有一个元素, 并且数组真实类型为NSMutableArray 插入值: 元素类型为 nil, %s",__FUNCTION__);
//            [self singleAddObject:[NSNull null]];
//        }else{
//            NSLog(@"真实类型是NSArray,什么都不做 %s",__FUNCTION__);
//        }
//    }
//}
//
//
//
//
//- (instancetype)safeObjectAtIndex:(NSUInteger)index {
//
////     数组越界也不会崩，但是开发的时候并不知道数组越界
//    if (index > (self.count - 1)) { // 数组越界
//        return nil;
//    }else { // 没有越界
//        return [self safeObjectAtIndex:index];
//    }
//}
//
//- (instancetype)safeobjectAtIndexedSubscript:(NSUInteger)index{
//
//    if (index > (self.count - 1)) { // 数组越界
//        return nil;
//    }else { // 没有越界
//        return [self safeobjectAtIndexedSubscript:index];
//    }
//
//}

@end






