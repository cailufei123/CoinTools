//
//  GTStyleManager.h
//  CoinTools
//
//  Created by MAC on 2020/10/12.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoinTools/CoinTools-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTStyleManager : NSObject
+(void)setStyleWhit:(GTHomeTitleModel *)homeTitleModel forLale:(UILabel *)contentLb;
+(void)loadingImage;
+(UIImage *)selecrDotStyle:(UIColor * )color ;
+(GTChartPMarkerView * )getChartPMarkerViewWhit;
@end

NS_ASSUME_NONNULL_END
