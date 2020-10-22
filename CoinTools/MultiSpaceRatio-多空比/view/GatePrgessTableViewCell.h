//
//  GatePrgessTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pressView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GatePrgessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLb;
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property(nonatomic,strong)pressView *press;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,strong)GTPublicContentModel * lsalldtl;

@end

NS_ASSUME_NONNULL_END
