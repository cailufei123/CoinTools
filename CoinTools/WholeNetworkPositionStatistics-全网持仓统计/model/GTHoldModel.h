//
//  GTHoldModel.h
//  CoinTools
//
//  Created by MAC on 2020/10/20.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTHoldModel : NSObject
@property(nonatomic,strong)GTPublicContentModel * okexPosition;
@property(nonatomic,strong)GTPublicContentModel * binancePosition;
@property(nonatomic,strong)GTPublicContentModel * bybitPosition;
@property(nonatomic,strong)GTPublicContentModel * bitcokePosition;
@property(nonatomic,strong)GTPublicContentModel * holdbigtitle;
@property(nonatomic,strong)GTPublicContentModel * holdcontract;
@property(nonatomic,strong)GTPublicContentModel * huobiPosition_quarter;
@property(nonatomic,strong)GTPublicContentModel * holdcontract_total;
@property(nonatomic,strong)GTPublicContentModel * huobiPosition;
@property(nonatomic,strong)GTPublicContentModel * bitmexPosition;


@end

NS_ASSUME_NONNULL_END

