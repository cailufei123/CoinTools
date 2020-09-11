//
//  Gateffff.h
//  block-pro
//
//  Created by 蔡路飞 on 2020/8/29.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateHearCategoryView : UIView<JXCategoryViewDelegate>
@property (strong, nonatomic) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, copy) void(^selectblock)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
