//
//  GTFearIndexLineChartsTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTFearIndexModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GTFearIndexLineChartsTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^selectBlock) (void);
@property(nonatomic,strong)GTPublicContentModel * fearIndexPublicContentModel;
+(instancetype)loadTableViewCell;
@end

NS_ASSUME_NONNULL_END
