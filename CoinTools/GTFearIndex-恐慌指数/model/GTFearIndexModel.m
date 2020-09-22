//
//  GTFearIndexModel.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTFearIndexModel.h"



@implementation GTBcoin_btc_vix_infoModel

@end

@implementation GTBcoin_btc_vix_data_infoModel

@end

@implementation GTFearIndexModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bcoin_btc_vix_info" : [GTBcoin_btc_vix_infoModel class],@"bcoin_btc_vix_data_info" : [GTBcoin_btc_vix_data_infoModel class]};
}
@end
