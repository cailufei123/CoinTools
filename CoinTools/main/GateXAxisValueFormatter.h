//
//  GateXAxisValueFormatter.h
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GateHomeModel.h"
@import Charts;

NS_ASSUME_NONNULL_BEGIN

@interface GateXAxisValueFormatter : NSObject<IChartAxisValueFormatter>
+(instancetype)getGateXAxisValueFormatter;

@property (nonatomic, strong)NSArray<GateDiffLineModel *> * possArr;
@end

NS_ASSUME_NONNULL_END
