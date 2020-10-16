//
//  GTHomeModel.h
//  CoinTools
//
//  Created by MAC on 2020/9/19.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface GTBcoin_ms_coin_infoModel : NSObject
@property(nonatomic,copy)NSString *coin_type;//": "BTC",
@property(nonatomic,copy)NSString *offer;//": "$10988.86;+1.01%",
@property(nonatomic,copy)NSString *market_sentiment;//": "多空人数比低位",
@property(nonatomic,copy)NSString *hold_cnt;//": "OKEx  $6.08亿;BitMEX $6.2亿",
@property(nonatomic,copy)NSString *stock_burst_amt;//": "1H  $445万;24H $2141万",
@property(nonatomic,copy)NSString *long_short_rate;//": "多:空=0.76",
@property(nonatomic,copy)NSString *amount_rate;//": "多:空=0.73",
@property(nonatomic,copy)NSString *quarterly_premium;//": "+$233.71",
@property(nonatomic,copy)NSString *all_long_short;//": "多头 50.41%",
@property(nonatomic,copy)NSString *perpetual_contract;//": "+0.010%",
@property(nonatomic,copy)NSString *okex_trend;//": "多:空=45%  54%",
@property(nonatomic,copy)NSString *okex_index;//": "多:空=20%  17%",
@property(nonatomic,copy)NSString *currency_rate;//": "5.44%"
@end

@interface GTBcoin_btc_offer_infoModel : NSObject
@property(nonatomic,copy)NSString *btc_offer;
@property(nonatomic,copy)NSString *rise_fall;
@property(nonatomic,copy)NSString *vix;
@end

@interface GTBcoin_btc_base_infoModel : NSObject
@property(nonatomic,copy)NSString *data_type;
@property(nonatomic,copy)NSString *data_result;
@end







@interface GTHomeTitleModel : NSObject
@property(nonatomic,assign)NSInteger size;//":"12",
@property(nonatomic,copy)NSString *content;//":"爆仓数据",
@property(nonatomic,assign)BOOL blod;//":"1",
@property(nonatomic,copy)NSString *color;//":
@property(nonatomic,copy)NSString *url;
@end

@interface GTAlldatalistModel : NSObject
@property(nonatomic,strong) NSArray<NSArray<GTHomeTitleModel*>  *> * datalist;
@property(nonatomic,strong) GTHomeTitleModel * title;
@end
@interface GTHomepageboxModel : NSObject
@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;
@end



@interface GTHomevixModel : NSObject


@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;

@end



@interface GTHomepaglistModel : NSObject
@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;

@end

@interface GTHomepage_navigationModel : NSObject
@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;

@end


@interface GTHomeHomepagebigtitleModel : NSObject
@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;
@end


@interface GTHomeModel : NSObject
@property(nonatomic,strong)GTHomevixModel * homepagevix;//
@property(nonatomic,strong)GTHomepageboxModel * homepagebox;//
@property(nonatomic,strong)GTHomepaglistModel * homepaglist;//
@property(nonatomic,strong)GTHomepage_navigationModel * homepage_navigation;//
@property(nonatomic,strong)GTHomeHomepagebigtitleModel * homepagebigtitle;//

@end








NS_ASSUME_NONNULL_END
