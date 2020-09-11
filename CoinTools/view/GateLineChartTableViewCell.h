//
//  GateLineChartTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GateHomeModel.h"
NS_ASSUME_NONNULL_BEGIN
@import Charts;

@interface GateLineChartTableViewCell : UITableViewCell<ChartViewDelegate,IChartAxisValueFormatter,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) IBOutlet LineChartView *lineChartView;

@property (nonatomic, strong)NSArray<GateDiffLineModel *> * possArr;
@property (nonatomic, strong)NSMutableArray<GateDiffLineModel *> * tempPossArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionLyoutH;
@property (weak, nonatomic) IBOutlet UIView *topSelectView;

@end

NS_ASSUME_NONNULL_END
