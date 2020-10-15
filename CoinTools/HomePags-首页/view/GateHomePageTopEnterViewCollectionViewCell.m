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
    GTHomeTitleModel * homeTitleModel  =  [GTDataManager getItemModelWhit:alldatalistModel.datalist.firstObject].firstObject;
    GTHomeTitleModel * homeTitleModel2  =  [GTDataManager getItemModelWhit:alldatalistModel.datalist.lastObject].firstObject;
    self.titleLb.text = alldatalistModel.title.content;
    [GTStyleManager setStyleWhit:alldatalistModel.title forLale: self.titleLb];
    
    self.moneyLb.text =  homeTitleModel.content;
    [GTStyleManager setStyleWhit:homeTitleModel forLale: self.moneyLb];
    
    self.twentyFourHourNumberLb.text =  homeTitleModel2.content;
    [GTStyleManager setStyleWhit:homeTitleModel2 forLale: self.twentyFourHourNumberLb];
   

   
}
@end
