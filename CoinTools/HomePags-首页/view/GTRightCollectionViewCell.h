//
//  GTRightCollectionViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTRightCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *coinTypeBg;
@property (weak, nonatomic) IBOutlet UIView *coinPriceBg;
@property (weak, nonatomic) IBOutlet UIView *coinMarketBg;
@property (weak, nonatomic) IBOutlet UIView *coinQuantityBg;
@property (weak, nonatomic) IBOutlet UIView *coinBurstPriceBg;
@property (weak, nonatomic) IBOutlet UIView *coinPeopleBg;
@property (weak, nonatomic) IBOutlet UIView *coinDuibiBg;

@property (weak, nonatomic) IBOutlet UIView *coinJiduBg;
@property (weak, nonatomic) IBOutlet UIView *coinWholeNetworkBg;

@property (weak, nonatomic) IBOutlet UIView *coinHeyueBg;

@property (weak, nonatomic) IBOutlet UIView *jinyingQuShiBg;

@property (weak, nonatomic) IBOutlet UIView *chiCangZhibaioBg;
@property (weak, nonatomic) IBOutlet UIView *rongZiBg;



@property (weak, nonatomic) IBOutlet UILabel *coinTypeLb;

@property (weak, nonatomic) IBOutlet UILabel *coinPriceLb;
@property (weak, nonatomic) IBOutlet UILabel *coinPriceBiLb;

@property (weak, nonatomic) IBOutlet UILabel *coinMarketLb;

@property (weak, nonatomic) IBOutlet UILabel *coinQuantitymoney1;
@property (weak, nonatomic) IBOutlet UILabel *coinQuantitymoney2;

@property (weak, nonatomic) IBOutlet UILabel *coinBurstPrice1;
@property (weak, nonatomic) IBOutlet UILabel *coinBurstPrice24;

@property (weak, nonatomic) IBOutlet UILabel *coinPeopleLb;

@property (weak, nonatomic) IBOutlet UILabel *coinDuibiLb;

@property (weak, nonatomic) IBOutlet UILabel *coinJiduLb;

@property (weak, nonatomic) IBOutlet UILabel *coinWholeNetworkLb;

@property (weak, nonatomic) IBOutlet UILabel *coinHeyueLb;
@property (weak, nonatomic) IBOutlet UIImageView *titleimageView;
@property (weak, nonatomic) IBOutlet UILabel *jinyingQuShiLb;

@property (weak, nonatomic) IBOutlet UILabel *chiCangZhibaioLb;
@property (weak, nonatomic) IBOutlet UILabel *rongZiLb;



@property (weak, nonatomic) GTBcoin_ms_coin_infoModel * bcoin_ms_coin_infoModel;
@end

NS_ASSUME_NONNULL_END
