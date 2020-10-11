//
//  GTDotManager.h
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GatePublicSelectModel.h"
#import <CoinTools/CoinTools-Swift.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTDotManager : NSObject
+ (void)chartDotManagerValueSelected:(CombinedChartView * _Nonnull)chartView
entry:(ChartDataEntry * _Nonnull)entry
                           highlight:(ChartHighlight * _Nonnull)highlight publicSelectModels:(NSArray *  )selectModels;
@end

NS_ASSUME_NONNULL_END
