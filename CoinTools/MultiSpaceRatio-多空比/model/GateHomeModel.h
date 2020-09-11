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

     



NS_ASSUME_NONNULL_END
