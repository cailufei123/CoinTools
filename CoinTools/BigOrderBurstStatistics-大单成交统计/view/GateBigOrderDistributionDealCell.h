//
//  GateBigOrderDistributionDealCell.h
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GateBigOrderDistributionDealCell : UITableViewCell <ChartViewDelegate, IChartAxisValueFormatter>
@property (weak, nonatomic) IBOutlet CombinedChartView *chartView;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet UIView *bottomSelectView;
@property(nonatomic,strong)GTBigOrderModel * bigOrderModel;
@end

NS_ASSUME_NONNULL_END
