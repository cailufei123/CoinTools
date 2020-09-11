//
//  GateWholeNetworkBigOrderStatisticsCollectionCell.h
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateWholeNetworkBigOrderStatisticsCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *titleBgView;
@property(nonatomic,strong) CAShapeLayer * shapeLayer ;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *buyLb;
@property (weak, nonatomic) IBOutlet UILabel *sellLb;
@end

NS_ASSUME_NONNULL_END
