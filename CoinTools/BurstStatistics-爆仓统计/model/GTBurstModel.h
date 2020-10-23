//
//  GTBurstModel.h
//  CoinTools
//
//  Created by MAC on 2020/9/19.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTPublicContentModel : NSObject
@property(nonatomic,strong) NSArray<GTAlldatalistModel *> * alldatalist;
@property(nonatomic,copy) NSString * title;
@end

@interface GTBurstModel : NSObject
@property(nonatomic,strong)GTPublicContentModel * burstbigtitle;
@property(nonatomic,strong)GTPublicContentModel * burstbourse;
@property(nonatomic,strong)GTPublicContentModel * burstcoin;
@property(nonatomic,strong)GTPublicContentModel * burstinfo;
@property(nonatomic,strong)GTPublicContentModel * burstdtl;
@property(nonatomic,strong)GTPublicContentModel * burstcalpic;
@property(nonatomic,strong)GTPublicContentModel * burstfuture;

@end

NS_ASSUME_NONNULL_END

