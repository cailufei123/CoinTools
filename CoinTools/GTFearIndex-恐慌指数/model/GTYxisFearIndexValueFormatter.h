//
//  GTXYxisFearIndexValueFormatter.h
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GTYxisFearIndexValueFormatter : NSObject<IChartAxisValueFormatter>
+(instancetype)getGTYxisFearIndexValueFormatter;

@property (nonatomic, strong)NSArray * publicArry;
@end

NS_ASSUME_NONNULL_END
