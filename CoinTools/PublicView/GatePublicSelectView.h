//
//  GatePublicSelectView.h
//  block-pro
//
//  Created by MAC on 2020/9/3.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GatePublicSelectModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GatePublicSelectView : UIView
@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,assign)BOOL   checkboxEnabled;
@property(nonatomic,assign)BOOL   specialCircularEnabled;

@property(nonatomic,assign)NSInteger   selectIndex;
@property(nonatomic,copy) void (^selectBlock)(NSInteger index,GatePublicSelectModel * publicSelectModel);
@end

NS_ASSUME_NONNULL_END
