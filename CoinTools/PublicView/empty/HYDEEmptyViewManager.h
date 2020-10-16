//
//  HYDEEmptyViewManager.h
//  HYDECarelink
//
//  Created by 李莹 on 2018/6/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYDEEmptyPlaceHolderView;

typedef NS_ENUM(NSInteger, HYDEEmptyType) {
    NoNetwork,
    NoData,
    NoCollect,
    NoMessage,
    NoSearch,
    NoCurrentOrder,
    NoHistoryOrder,
    NoFollowDoctor,
    NoFollowHistory,
    NoFollowOrganization,
    NoMyDoctor,
    NoMyRegister,
    NoConsume,
    NoRecharge,
    NoViedo,
    NoConsult,
    NoYiYuan,
    NoBuyVideo,
    NoOpenNumber,
    NoVipCard,
    NoSkill,
    NohistoyOrder,
};

@interface HYDEEmptyViewManager : UIView

+ (HYDEEmptyPlaceHolderView *)showEnptyWith:(HYDEEmptyType)emptyType reloadBlock:(void(^)(void))reloadAction;

+ (HYDEEmptyPlaceHolderView *)showEnptyWithError:(BOOL)isError withTitle:(NSString *)title withContent:(NSString *)emptyString withImage:(NSString *)imageName withReload:(NSString *)reloadString reloadBlock:(void(^)(void))reloadAction;
@end
