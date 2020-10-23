//
//  GTBigOrderModel.h
//  CoinTools
//
//  Created by MAC on 2020/10/22.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTBigOrderModel : NSObject
@property(nonatomic,strong)GTPublicContentModel * bigdeal_spot;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_future;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_dist_binance;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_dist_okex;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_bigtitle;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_info_pic;
@property(nonatomic,strong)GTPublicContentModel * bigdeal_dist_huobi;
@property(nonatomic,strong)GTPublicContentModel *bigdeal_total;
@property(nonatomic,strong)GTPublicContentModel *bigdeal_dist_bitmex;

@end

NS_ASSUME_NONNULL_END


