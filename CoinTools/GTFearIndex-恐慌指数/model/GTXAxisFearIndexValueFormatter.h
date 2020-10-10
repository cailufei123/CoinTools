//
//  GTXAxisFearIndexValueFormatter.h
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//
#import "GateHomeModel.h"
typedef NS_ENUM(NSInteger, GTFormatterXType) {
   GTFormatterXDuoKong,
};
#import <Foundation/Foundation.h>
@import Charts;
NS_ASSUME_NONNULL_BEGIN

@interface GTXAxisFearIndexValueFormatter : NSObject<IChartAxisValueFormatter>
+(instancetype)getGTXAxisFearIndexValueFormatter;
@property (nonatomic, strong)NSArray * publicArry;

@property (nonatomic, assign)GTFormatterXType  formatterType;
@end

NS_ASSUME_NONNULL_END
