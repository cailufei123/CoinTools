//
//  GTHomeModel.m
//  CoinTools
//
//  Created by MAC on 2020/9/19.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHomeModel.h"


@implementation GTBcoin_ms_coin_infoModel

@end
@implementation GTBcoin_btc_offer_infoModel

@end

@implementation GTBcoin_btc_base_infoModel

@end


@implementation GTHomeModel
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"bcoin_btc_base_info" : [GTBcoin_btc_base_infoModel class],@"bcoin_btc_offer_info" : [GTBcoin_btc_offer_infoModel class],@"bcoin_ms_coin_info" : [GTBcoin_ms_coin_infoModel class]};
//}

@end


@implementation GTHomevixModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"alldatalist" : [GTAlldatalistModel class]};
}
@end


@implementation GTHomeTitleModel : NSObject
@end

@implementation GTAlldatalistModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"datalist" : [NSArray<GTHomeTitleModel*> class]};
}

@end
@implementation GTHomepageboxModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"alldatalist" : [GTAlldatalistModel class]};
}
@end





@implementation GTHomepaglistModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"alldatalist" : [GTAlldatalistModel class]};
}
@end



