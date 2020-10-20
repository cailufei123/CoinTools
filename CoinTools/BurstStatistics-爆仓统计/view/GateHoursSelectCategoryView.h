//
//  GateHoursSelectView.h
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryView.h"
#import "JXCategoryTitleBackgroundView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateHoursSelectCategoryView : UIView<JXCategoryViewDelegate>
@property (strong, nonatomic) JXCategoryTitleBackgroundView *categoryView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) void(^selectblock)(NSInteger index);
@property (strong, nonatomic) UILabel *titleLb;
//@property (nonatomic, copy) NSArray *titles;
@end

NS_ASSUME_NONNULL_END
