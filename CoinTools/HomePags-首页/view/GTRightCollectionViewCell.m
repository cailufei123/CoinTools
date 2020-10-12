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
    self.bgs = [NSArray arrayWithObjects:self.coinTypeBg,self.coinPriceBg,self.coinMarketBg,self.coinQuantityBg,self.coinBurstPriceBg,self.coinPeopleBg,self.coinDuibiBg,self.coinJiduBg,self.coinWholeNetworkBg,self.coinHeyueBg,self.rongZiBg,self.chiCangZhibaioBg, self.jinyingQuShiBg, nil];
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
    
    self.coinPriceLb.font = self.coinPriceBiLb.font = self.coinMarketLb.font =  self.coinQuantitymoney1.font = self.coinQuantitymoney2.font = self.coinBurstPrice1.font =  self.coinBurstPrice24.font = self.coinPeopleLb.font = self.coinDuibiLb.font = self.coinJiduLb.font = self.coinWholeNetworkLb.font = self.coinHeyueLb.font = self.rongZiLb.font = self.chiCangZhibaioLb.font = self.jinyingQuShiLb.font =  gateFont(11, Normal);
  

  self.coinPriceLb.textColor = self.coinPriceBiLb.textColor = self.coinMarketLb.textColor =   self.coinQuantitymoney1.textColor = self.coinQuantitymoney2.textColor = self.coinBurstPrice1.textColor =  self.coinBurstPrice24.textColor = self.coinPeopleLb.textColor = self.coinDuibiLb.textColor = self.coinJiduLb.textColor = self.coinWholeNetworkLb.textColor = self.coinHeyueLb.textColor = self.rongZiLb.textColor = self.chiCangZhibaioLb.textColor = self.jinyingQuShiLb.textColor =  gateColor(@"333B46");

self.coinMarketLb.textColor = gateColor(@"25CC25");


 

   

 

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


-(void)setAlldatalistModel:(GTAlldatalistModel *)alldatalistModel{
    self.coinTypeLb.text  = alldatalistModel.title.content;
    [GTStyleManager setStyleWhit:alldatalistModel.title forLale:self.coinTypeLb];
    
    self.coinPriceLb.text  = [alldatalistModel.datalist[0].content isNotBlank]?alldatalistModel.datalist[0].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[0] forLale:self.coinPriceLb];
  
  
    self.coinPriceBiLb.text = [alldatalistModel.datalist[1].content isNotBlank]?alldatalistModel.datalist[1].content:@"";
   [GTStyleManager setStyleWhit:alldatalistModel.datalist[1] forLale:self.coinPriceBiLb];
    
    self.coinMarketLb.text =  [alldatalistModel.datalist[2].content isNotBlank]?alldatalistModel.datalist[2].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[2] forLale:self.coinMarketLb];
    
    self.coinQuantitymoney1.text =[alldatalistModel.datalist[3].content isNotBlank]?alldatalistModel.datalist[3].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[3] forLale:self.coinQuantitymoney1];
    
    self.coinQuantitymoney2.text =[alldatalistModel.datalist[4].content isNotBlank]?alldatalistModel.datalist[4].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[4] forLale:self.coinQuantitymoney2];
    
    self.coinBurstPrice1.text =[alldatalistModel.datalist[5].content isNotBlank]?alldatalistModel.datalist[5].content:@"";
      [GTStyleManager setStyleWhit:alldatalistModel.datalist[5] forLale:self.coinBurstPrice1];
    
    self.coinBurstPrice24.text =[alldatalistModel.datalist[6].content isNotBlank]?alldatalistModel.datalist[6].content:@"";
      [GTStyleManager setStyleWhit:alldatalistModel.datalist[6] forLale:self.coinBurstPrice24];
    
    self.coinPeopleLb.text =[alldatalistModel.datalist[7].content isNotBlank]?alldatalistModel.datalist[7].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[7] forLale:self.coinPeopleLb];
    self.coinDuibiLb.text =[alldatalistModel.datalist[8].content isNotBlank]?alldatalistModel.datalist[8].content:@"";
         [GTStyleManager setStyleWhit:alldatalistModel.datalist[8] forLale:self.coinDuibiLb];
    self.coinJiduLb.text =[alldatalistModel.datalist[9].content isNotBlank]?alldatalistModel.datalist[9].content :@"";
      [GTStyleManager setStyleWhit:alldatalistModel.datalist[9] forLale:self.coinJiduLb];
    self.coinWholeNetworkLb.text =[alldatalistModel.datalist[10].content isNotBlank]?alldatalistModel.datalist[10].content:@"";
    [GTStyleManager setStyleWhit:alldatalistModel.datalist[10] forLale:self.coinWholeNetworkLb];
    self.coinHeyueLb.text =  [alldatalistModel.datalist[11].content isNotBlank]?alldatalistModel.datalist[11].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[11] forLale:self.coinHeyueLb];
    
    self.jinyingQuShiLb.text = [alldatalistModel.datalist[12].content isNotBlank]?alldatalistModel.datalist[12].content:@"";
     [GTStyleManager setStyleWhit:alldatalistModel.datalist[12] forLale:self.jinyingQuShiLb];
    
    self.chiCangZhibaioLb.text = [alldatalistModel.datalist[13].content isNotBlank]?alldatalistModel.datalist[13].content:@"";
//     [GTStyleManager setStyleWhit:alldatalistModel.datalist[13] forLale:self.chiCangZhibaioLb];
////    self.rongZiLb.text =[alldatalistModel.datalist[14].content isNotBlank]?alldatalistModel.datalist[14].content :@"";
////      [GTStyleManager setStyleWhit:alldatalistModel.datalist[14] forLale:self.rongZiLb];
    
}
-(void)setBcoin_ms_coin_infoModel:(GTBcoin_ms_coin_infoModel *)bcoin_ms_coin_infoModel{
    
    self.coinTypeLb.text  = bcoin_ms_coin_infoModel.coin_type;
    self.coinPriceLb.text =[[self geStringBy:bcoin_ms_coin_infoModel.offer] firstObject];
    self.coinPriceBiLb.text =[[self geStringBy:bcoin_ms_coin_infoModel.offer] lastObject];
    if ([[[self geStringBy:bcoin_ms_coin_infoModel.offer] lastObject] hasPrefix:@"-"]) {
        self.coinPriceBiLb.textColor = gateColor(@"FF0000");
    }else{
        self.coinPriceBiLb.textColor = gateColor(@"25CC25");
    }
    
    self.coinMarketLb.text =  bcoin_ms_coin_infoModel.market_sentiment;
    if ([bcoin_ms_coin_infoModel.market_sentiment containsString:@"高"]) {
         self.coinMarketLb.textColor = gateColor(@"FF0000");
    }else if([bcoin_ms_coin_infoModel.market_sentiment containsString:@"低"]){
         self.coinMarketLb.textColor = gateColor(@"25CC25");
    }else{
         self.coinMarketLb.textColor = gateColor(@"333B46");
    }
    self.coinQuantitymoney1.text =[[self geStringBy:bcoin_ms_coin_infoModel.hold_cnt] firstObject];
    self.coinQuantitymoney2.text =[[self geStringBy:bcoin_ms_coin_infoModel.hold_cnt] lastObject];
    self.coinBurstPrice1.text =[[self geStringBy:bcoin_ms_coin_infoModel.stock_burst_amt] firstObject];
    self.coinBurstPrice24.text =[[self geStringBy:bcoin_ms_coin_infoModel.stock_burst_amt] lastObject];
    self.coinPeopleLb.text =bcoin_ms_coin_infoModel.long_short_rate;
    self.coinDuibiLb.text =bcoin_ms_coin_infoModel.amount_rate;
    self.coinJiduLb.text =bcoin_ms_coin_infoModel.quarterly_premium;
    self.coinWholeNetworkLb.text =bcoin_ms_coin_infoModel.all_long_short;
    self.coinHeyueLb.text =  bcoin_ms_coin_infoModel.perpetual_contract;
    
     self.jinyingQuShiLb.text = bcoin_ms_coin_infoModel.okex_trend;
     self.chiCangZhibaioLb.text = bcoin_ms_coin_infoModel.okex_index;
     self.rongZiLb.text = bcoin_ms_coin_infoModel.currency_rate;
}
-(NSArray *)geStringBy:(NSString * )string{
    NSArray *array = [string componentsSeparatedByString:@";"]; //从字符A中分隔成2个元素的数组
   return array;
}
@end
