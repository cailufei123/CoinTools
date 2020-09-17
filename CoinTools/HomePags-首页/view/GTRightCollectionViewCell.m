//
//  GTRightCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTRightCollectionViewCell.h"
@interface GTRightCollectionViewCell()
@property(nonatomic,strong)NSArray * bgs;
@end
@implementation GTRightCollectionViewCell












- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgs = [NSArray arrayWithObjects:self.coinTypeBg,self.coinPriceBg,self.coinMarketBg,self.coinQuantityBg,self.coinBurstPriceBg,self.coinPeopleBg,self.coinDuibiBg,self.coinJiduBg,self.coinWholeNetworkBg,self.coinHeyueBg, nil];
    for (int i = 0; i < self.bgs.count; i++) {
        UIView * view = self.bgs[i];
        if (i%2 == 0) {
          view.backgroundColor = gateColor(@"f5f5f5");
        }else{
          view.backgroundColor = gateColor(@"ffffff");
        }
        
    }
 
    self.titleimageView.image = getImage(@"homeImages/6-6@3x");
    self.coinTypeLb.font = gateFont(12, Medium);
    self.coinTypeLb.textColor  = gateColor(@"333B46");
    
    self.coinPriceLb.font = self.coinPriceBiLb.font = self.coinMarketLb.font =  self.coinQuantitymoney1.font = self.coinQuantitymoney2.font = self.coinBurstPrice1.font =  self.coinBurstPrice24.font = self.coinPeopleLb.font = self.coinDuibiLb.font = self.coinJiduLb.font = self.coinWholeNetworkLb.font = self.coinHeyueLb.font = gateFont(11, Normal);
  

  self.coinPriceLb.textColor = self.coinPriceBiLb.textColor = self.coinMarketLb.textColor =   self.coinQuantitymoney1.textColor = self.coinQuantitymoney2.textColor = self.coinBurstPrice1.textColor =  self.coinBurstPrice24.textColor = self.coinPeopleLb.textColor = self.coinDuibiLb.textColor = self.coinJiduLb.textColor = self.coinWholeNetworkLb.textColor = self.coinHeyueLb.textColor =  gateColor(@"333B46");

 
self.coinMarketLb.textColor = gateColor(@"25CC25");

self.coinQuantitymoney1.textColor = gateColor(@"FF0000");
 

   

 

    self.coinTypeLb.text  = @"BTC";
    self.coinPriceLb.text = @"$90422.12";
    self.coinPriceBiLb.text = @"+3.79%";
    self.coinMarketLb.text =  @"多空人数比位低";
    self.coinQuantitymoney1.text =@"OKEx $6.13亿";
    self.coinQuantitymoney2.text =@"OKEx $6.13亿";
    self.coinBurstPrice1.text =@"1H $169万";
    self.coinBurstPrice24.text =@"24H $41278万";
    self.coinPeopleLb.text =@"多:空=1:3";
    self.coinDuibiLb.text =@"多:空=1:3";
    self.coinJiduLb.text =@"+$185.04";
    self.coinWholeNetworkLb.text =@"多:空=1:3";
    self.coinHeyueLb.text =  @"-0.0001%";
 

   
   
}

@end
