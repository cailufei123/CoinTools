//
//  GateXHorstAxisValueFormatter.h
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GateXHorstAxisValueFormatter : NSObject<IChartAxisValueFormatter>
+(instancetype)getGateXHorstAxisValueFormatter;
@property(nonatomic,strong)NSArray * publicArr;
@end

NS_ASSUME_NONNULL_END
