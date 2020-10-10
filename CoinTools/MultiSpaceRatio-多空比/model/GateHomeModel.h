//
//  GateHomeModel.h
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GatePublicSelectModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface GateBurst_dtlModel : NSObject

@property(nonatomic,copy) NSString * burst_amt;
@property(nonatomic,copy) NSString * burst_plat;
@property(nonatomic,copy) NSString * burst_time;
@property(nonatomic,copy) NSString * bran_type;

@end
@interface GateDiffModel : NSObject

@property(nonatomic,copy) NSString * burst_amt;
@property(nonatomic,copy) NSString * burst_plat;
@property(nonatomic,copy) NSString * burst_time;
@property(nonatomic,copy) NSString * bran_type;

@end

@interface GateDiffLineModel : GatePublicSelectModel

@property(nonatomic,copy) NSArray * line;
@property(nonatomic,copy) NSString * name;

@end

@interface GateLong_shortModel : NSObject

@property(nonatomic,copy) NSString * long_short_type;
@property(nonatomic,copy) NSString * short_rate;
@property(nonatomic,copy) NSString * long_rate;
@property(nonatomic,copy) NSString * logo_url;

@end
@interface GateH_burst_amtModel : NSObject

@property(nonatomic,copy) NSString * h_burst_amt_ch24;
@property(nonatomic,copy) NSString * h_burst_amt_us24;
@property(nonatomic,copy) NSString * h_burst_amt_us1;
@property(nonatomic,copy) NSString * h_burst_amt_ch1;

@end
@interface GateHomeModel : NSObject
@property(nonatomic,strong) NSArray<GateBurst_dtlModel *> * burst_dtl;
@property(nonatomic,strong) NSArray<GateDiffLineModel *> * diff;
@property(nonatomic,strong) NSArray<GateLong_shortModel *> * long_short;
@property(nonatomic,strong) NSArray<GateDiffLineModel *> * poss;
@property(nonatomic,strong)GateH_burst_amtModel * burst_amt;
@end

     




@interface GTSpaceRatioSubvModel : NSObject
@property(nonatomic,copy) NSString *exchange;//" : "Okex",
@property(nonatomic,copy) NSString *future_type;//" : "quarter",
@property(nonatomic,copy) NSString *coin_type;//" : "BTC",
@property(nonatomic,copy) NSString *time_type;//" : "5m",
@property(nonatomic,copy) NSString *long_rate;//" : "0.7415",
@property(nonatomic,copy) NSString *short_rate;//" : "0.2585"
@end


@interface GTSpaceRatioModel : NSObject

@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * BTC;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * EOS;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * BSV;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * XBT;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * LTC;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * XRP;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * ETH;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * ETC;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * BCH;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * TRX;

@end



@interface bcoin_coin_long_short_infoModel : NSObject
@property(nonatomic,copy) NSString *long_rate;//" : "0.7204",
@property(nonatomic,copy) NSString *exchange_future_type;//" : "Okex_quarter",
@property(nonatomic,copy) NSString *offer;//" : "10746.02",
@property(nonatomic,copy) NSString *time_type;//" : "5m",
@property(nonatomic,copy) NSString *time_stamp;//" : "1602144600",
@property(nonatomic,copy) NSString *total_type;//" : "1d",
@property(nonatomic,copy) NSString *coin_type;//" : "BTC"
@end

@interface GTbcoin_coin_long_short_infoModel : NSObject
@property(nonatomic,strong) NSArray<bcoin_coin_long_short_infoModel *> * Okex_quarter;
@property(nonatomic,strong) NSArray<bcoin_coin_long_short_infoModel *> * Huobi_quarter;
@property(nonatomic,strong) NSArray<bcoin_coin_long_short_infoModel *> * Okex_swap;

@end
@interface GTCoinSpaceRatioModel : NSObject

@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * bcoin_all_long_short_info;
@property(nonatomic,strong) NSArray<GTSpaceRatioSubvModel *> * bcoin_exchange_long_short_info;

@property(nonatomic,strong) GTbcoin_coin_long_short_infoModel * bcoin_coin_long_short_info;
@end

NS_ASSUME_NONNULL_END

