//
//  GTFearIndexModel.h
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GatePublicSelectModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GTBcoin_btc_vix_infoModel : NSObject
@property(nonatomic,copy)NSString *time_type;//": "yesterday",
@property(nonatomic,copy)NSString *vix_value;//": "47",
@property(nonatomic,copy)NSString *vix;//": "正常"
@end

@interface GTBcoin_btc_vix_data_infoModel : NSObject
@property(nonatomic,copy)NSString *time_type;//": "all",
@property(nonatomic,copy)NSString *time_stamp;//": "1600185600",
@property(nonatomic,copy)NSString *offer;//": "10665.72",
@property(nonatomic,copy)NSString *vix_value;//": "43"
@end


@interface GTFearIndexModel : GatePublicSelectModel
@property(nonatomic,strong)NSArray<GTBcoin_btc_vix_infoModel*> * bcoin_btc_vix_info;//恐慌仪表盘
@property(nonatomic,strong)NSArray<GTBcoin_btc_vix_data_infoModel*> * bcoin_btc_vix_data_info;//恐慌charts

@end

NS_ASSUME_NONNULL_END
