//
//  GTHoldCoinPieChartViewTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GTHoldCoinPieChartViewTableViewCell : UITableViewCell<ChartViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet PieChartView *pieChartView;
@property (weak, nonatomic) IBOutlet UITableView *topTableView;

@end

NS_ASSUME_NONNULL_END
