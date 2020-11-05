//
//  GateFaceOrientationLandStatisticsViewController.h
//  CoinTools
//
//  Created by MAC on 2020/11/3.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ChartsStype) {
    baoCang = 4,
    chiCang,
    duoKong,
    kongHuang,
};
@interface GateFaceOrientationLandStatisticsViewController : UIViewController
@property(nonatomic,strong)GTPublicContentModel * burstcalpic;
@property(nonatomic,assign) ChartsStype  chartsStype;

@end

NS_ASSUME_NONNULL_END
