//
//  GateDetailsViewController.h
//  block-pro
//
//  Created by MAC on 2020/8/28.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryListContainerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateDetailsViewController : UIViewController<JXCategoryListContentViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *type;
@end

NS_ASSUME_NONNULL_END
