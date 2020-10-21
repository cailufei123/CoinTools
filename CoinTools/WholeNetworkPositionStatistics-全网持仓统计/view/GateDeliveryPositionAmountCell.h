//
//  GateDeliveryPositionAmountCell.h
//  block-pro
//
//  Created by MAC on 2020/9/4.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
//CoinTools-Swift.h"
//#import <CoinTools/CoinTools.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GateDeliveryPositionAmountCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *topSelectView;
@property (weak, nonatomic) IBOutlet CombinedChartView *chartView;

@property (weak, nonatomic) IBOutlet UIView *describeView;
@property (weak, nonatomic) IBOutlet UILabel *describeLb;
@property(nonatomic,strong)GTPublicContentModel * holdData;
@end

NS_ASSUME_NONNULL_END
