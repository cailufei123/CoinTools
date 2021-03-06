//
//  GateHousBurstStatisticsTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SYLineProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateHousBurstStatisticsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet SYLineProgressView *lineProgressView;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@property (weak, nonatomic) IBOutlet UILabel *progressLb;

@end


NS_ASSUME_NONNULL_END
