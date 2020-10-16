//
//  HYDEEmptyViewManager.m
//  HYDECarelink
//
//  Created by 李莹 on 2018/6/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "HYDEEmptyViewManager.h"
#import "HYDEEmptyPlaceHolderView.h"

@implementation HYDEEmptyViewManager

+ (HYDEEmptyPlaceHolderView *)showEnptyWith:(HYDEEmptyType)emptyType reloadBlock:(void(^)(void))reloadAction{
    HYDEEmptyPlaceHolderView *holderView;
    if (emptyType == NoNetwork) {
        holderView = [[HYDEEmptyPlaceHolderView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) withTitle:nil withContent:@"网络出现问题了，请检查您的网络设置" withImage:getImageName(@"ic_hangqing_19x19_@3x") withHeaderTopValue:0 withlineNum:1 withNeedReload:YES withReloadText:@"点击重试" reloadBlock:^{
            !reloadAction ? : reloadAction();
        }];
    }
    else if (emptyType == NoData) {
        holderView = [[HYDEEmptyPlaceHolderView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) withTitle:nil withContent:@"暂时没有任何就诊人" withImage:getImageName(@"ic_no_data_311x147_@3x") withHeaderTopValue:0 withlineNum:1 withNeedReload:YES withReloadText:@"点击重试" reloadBlock:^{
            !reloadAction ? : reloadAction();
        }];
    }
   
    
    
    return holderView;
}

+ (HYDEEmptyPlaceHolderView *)showEnptyWithError:(BOOL)isError withTitle:(NSString *)title withContent:(NSString *)emptyString withImage:(NSString *)imageName withReload:(NSString *)reloadString reloadBlock:(void(^)(void))reloadAction{
    if (isError) {
       HYDEEmptyPlaceHolderView *holderView = [self showEnptyWith:NoNetwork reloadBlock:^{
            !reloadAction ? : reloadAction();
        }];
        return holderView;
    }
    else{
        HYDEEmptyPlaceHolderView *holderView = [[HYDEEmptyPlaceHolderView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) withTitle:title withContent:emptyString withImage:imageName withHeaderTopValue:0 withlineNum:0 withNeedReload:reloadString?YES:NO withReloadText:reloadString reloadBlock:^{
            !reloadAction ? : reloadAction();
        }];
        return holderView;
    }
}

@end
