//
//  GateHoldCoinTopMessageCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateHoldCoinTopMessageCell.h"
@interface GateHoldCoinTopMessageCell()
@property (weak, nonatomic) IBOutlet UILabel *holdCoinAddressLb;
@property (weak, nonatomic) IBOutlet UIButton *addressBt;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;

@property (weak, nonatomic) IBOutlet UILabel *hold10;
@property (weak, nonatomic) IBOutlet UILabel *hold10Percentage;
@property (weak, nonatomic) IBOutlet UILabel *hold20;
@property (weak, nonatomic) IBOutlet UILabel *hold20Percentage;
@property (weak, nonatomic) IBOutlet UILabel *hold50;
@property (weak, nonatomic) IBOutlet UILabel *hold50Percentage;
@property (weak, nonatomic) IBOutlet UILabel *hold100;
@property (weak, nonatomic) IBOutlet UILabel *hold100Percentage;


@end
@implementation GateHoldCoinTopMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.holdCoinAddressLb.font = gateFont(16, Medium);
    [self.addressBt setImage:getImage(@"wenhao") forState:UIControlStateNormal];
    self.numberLb.font = self.hold10.font =  self.hold10Percentage.font =self.hold20.font =self.hold20Percentage.font =  self.hold50.font =  self.hold50Percentage.font =    self.hold100.font =   self.hold100Percentage.font =   self.holdCoinAddressLb.font = gateFont(12, Normal);
    self.holdCoinAddressLb.textColor = [UIColor blackColor];
    self.hold100.textColor = self.hold50.textColor =  self.hold20.textColor = self.hold10.textColor =  self.holdCoinAddressLb.textColor =gateColor(@"89898c");
    
      self.hold10Percentage.textColor =self.hold20Percentage.textColor =   self.hold50Percentage.textColor =    self.hold100Percentage.textColor =   self.numberLb.textColor = gateColor(@"060606");
    
   
 
  
  
}


@end
