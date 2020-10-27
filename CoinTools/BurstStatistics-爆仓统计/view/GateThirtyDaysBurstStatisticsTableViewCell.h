//
//  GateThirtyDaysBurstStatisticsTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBurstModel.h"
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GateThirtyDaysBurstStatisticsTableViewCell : UITableViewCell < ChartViewDelegate>
@property (nonatomic, strong) IBOutlet CombinedChartView *chartView;
@property (weak, nonatomic) IBOutlet UIView *bottomSelectView;
//@property (strong, nonatomic) NSArray<GTBcoin_coin_30d_calendar_infoModel *>*  bcoin_coin_30d_calendar_infos;
@property(nonatomic,strong)GTPublicContentModel * burstcalpic;
@end

NS_ASSUME_NONNULL_END
