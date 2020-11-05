//
//  GTDuoKongLineChartsTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GateHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GTDuoKongLineChartsTableViewCell : UITableViewCell
@property(nonatomic,strong)GTPublicContentModel * duoKongData;
@property (nonatomic, copy) void(^selectBlock) (void);
+(instancetype)loadTableViewCell;
@end

NS_ASSUME_NONNULL_END
