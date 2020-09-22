//
//  GTBurstModel.h
//  CoinTools
//
//  Created by MAC on 2020/9/19.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface GTBcoin_coin_burst_infoModel : NSObject
@property(nonatomic,strong)NSString * coin_type;//": "ALL",
@property(nonatomic,strong)NSString *burst_amt_1h;//": "124248191",
@property(nonatomic,strong)NSString *eq_amt_1h;//": "625682871",
@property(nonatomic,strong)NSString *burst_amt_24;//": "18318666.999086622",
@property(nonatomic,strong)NSString *eq_amt_24;//": "92248233.85138597"
@end


@interface GTBcoin_coin_burst_total_infoModel : NSObject
@property(nonatomic,strong)NSString * time_type;//": "1h",
@property(nonatomic,copy)NSString * coin_type;//": "BTC",
@property(nonatomic,strong)NSString * burst_amt;//": "3954462.31903",
@property(nonatomic,strong)NSString * equivalent_amt;//": "370"
@end

@interface GTBcoin_coin_burst_exchange_infoModel : NSObject

@property(nonatomic,strong)NSString *time_type;//": "1h",
@property(nonatomic,strong)NSString *exchange;//": "OKEx合约",
 @property(nonatomic,strong)NSString *burst_amt;//": "2800959.3978999997",
@property(nonatomic,strong)NSString *exchange_amt_rate;//": "0.1529"
@end

@interface GTBcoin_coin_30d_long_short_infoModel : NSObject
@property(nonatomic,strong)NSString *coin_type;//": "all",
@property(nonatomic,strong)NSString *burst_amt;//": "4075901768.55",
@property(nonatomic,strong)NSString *long_short_rate;//": "3.6476"

@end
@interface GTBcoin_coin_30d_calendar_infoModel : NSObject
@property(nonatomic,strong)NSString *coin_type;//": "all",
@property(nonatomic,strong)NSString *date;//": "2020-09-16",
@property(nonatomic,strong)NSString *buy_amount;//": "2995462.09",
@property(nonatomic,strong)NSString *sell_amount;//": "27160897.16"

@end

@interface GTBcoin_coin_burst_list_infoModel : NSObject

@property(nonatomic,strong)NSString *coin_type;//": "BTC",
@property(nonatomic,strong)NSString *time_stamp;//": "1600216200",
@property(nonatomic,strong)NSString *buy_amount;//": "940000",
@property(nonatomic,strong)NSString *equal_sheet;//": "940000",
@property(nonatomic,strong)NSString *contract_type;//": "XBT永续",
@property(nonatomic,strong)NSString *price;//": "10711.5",
@property(nonatomic,strong)NSString *burst_type;//": "多单爆仓"

@end
@interface GTBurstModel : NSObject
@property(nonatomic,strong)NSArray <GTBcoin_coin_burst_infoModel *>* bcoin_coin_burst_info;
@property(nonatomic,strong)NSArray <GTBcoin_coin_burst_total_infoModel *>* bcoin_coin_burst_total_info;
@property(nonatomic,strong)NSArray <GTBcoin_coin_burst_exchange_infoModel *>* bcoin_coin_burst_exchange_info;
@property(nonatomic,strong)NSArray <GTBcoin_coin_30d_long_short_infoModel *>* bcoin_coin_30d_long_short_info;
@property(nonatomic,strong)NSArray <GTBcoin_coin_30d_calendar_infoModel *>* bcoin_coin_30d_calendar_info;
@property(nonatomic,strong)NSArray <GTBcoin_coin_burst_list_infoModel *>* bcoin_coin_burst_list_info;


@end

NS_ASSUME_NONNULL_END
