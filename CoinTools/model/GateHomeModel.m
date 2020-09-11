//
//  GateHomeModel.m
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHomeModel.h"

@implementation GateBurst_dtlModel

@end
@implementation GateDiffModel

@end
@implementation GateDiffLineModel

@end
@implementation GateLong_shortModel

@end

@implementation GateHomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"diff" : [GateDiffLineModel class],@"long_short" : [GateLong_shortModel class],@"poss" : [GateDiffLineModel class],@"burst_dtl":[GateBurst_dtlModel class]};
}
@end

@implementation GateH_burst_amtModel : NSObject

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"h_burst_amt_ch24":@[@"24h_burst_amt_ch"],@"h_burst_amt_us24":@[@"24h_burst_amt_us"],@"h_burst_amt_us1":@[@"1h_burst_amt_us"],@"h_burst_amt_ch1":@[@"1h_burst_amt_ch"],};
    
};

@end
