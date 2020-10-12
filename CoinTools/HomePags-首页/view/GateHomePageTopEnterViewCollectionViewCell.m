//
//  GateHomePageTopEnterViewCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateHomePageTopEnterViewCollectionViewCell.h"

@implementation GateHomePageTopEnterViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.bagView.backgroundColor = gateColor(@"ffe6e5");
 
    self.moneyLb.textColor  =self.titleLb.textColor  = self.twentyFourHourNumberLb.textColor  = gateColor(@"333B46");
    self.twentyFourHourNumberLb.font = self.moneyLb.font = gateFont(11, Normal);
    self.titleLb.font = gateFont(12, Medium);
}
-(void)layoutSubviews{
    [super layoutSubviews];
//      [self viewShadowPathWithColor:[UIColor grayColor] shadowOpacity:0.5 shadowRadius:1 shadowPathType:LeShadowPathAround shadowPathWidth:1];
}
-(void)setBcoin_btc_base_infoModel:(GTBcoin_btc_base_infoModel *)bcoin_btc_base_infoModel{
    self.titleLb.text = bcoin_btc_base_infoModel.data_type;
    self.moneyLb.text = bcoin_btc_base_infoModel.data_result;
}

-(void)setAlldatalistModel:(GTAlldatalistModel *)alldatalistModel{
    
    self.titleLb.text = alldatalistModel.title.content;
    self.titleLb.textColor =   gateColor(alldatalistModel.title.color);
    self.titleLb.font = gateFont(alldatalistModel.title.size, alldatalistModel.title.blod?Medium: Normal);
    
    
    self.moneyLb.text =  alldatalistModel.datalist.firstObject.content;
    self.moneyLb.textColor =   gateColor(alldatalistModel.datalist.firstObject.color);
    self.moneyLb.font = gateFont(alldatalistModel.datalist.firstObject.size, alldatalistModel.datalist.firstObject.blod?Medium: Normal);
    
    
    self.twentyFourHourNumberLb.text =  alldatalistModel.datalist.lastObject.content;
    self.moneyLb.textColor =   gateColor(alldatalistModel.datalist.lastObject.color);
    self.moneyLb.font = gateFont(alldatalistModel.datalist.lastObject.size, alldatalistModel.datalist.lastObject.blod?Medium: Normal);
   

   
}
@end
