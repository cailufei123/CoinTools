//
//  GateThirtyDaysBurstStatisticsTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GateThirtyDaysBurstStatisticsTableViewCell : UITableViewCell < ChartViewDelegate>
@property (nonatomic, strong) IBOutlet BarChartView *chartView;
@property (weak, nonatomic) IBOutlet UIView *bottomSelectView;
@end

NS_ASSUME_NONNULL_END
