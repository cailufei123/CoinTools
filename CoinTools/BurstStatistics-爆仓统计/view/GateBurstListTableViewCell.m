//
//  GateBurstListTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstListTableViewCell.h"

@implementation GateBurstListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLb.font =  self.typeLb.font =  self.moneyLb2.font =  self.moneyLb1.font =  gateFont(15, Medium);
    self.titleLb.textColor =  self.typeLb.textColor =  self.moneyLb2.textColor =  self.moneyLb1.textColor =  gateColor(@"283862");
    
    
    self.timeLb.font =  self.jiduLb.font =  self.tageLb.font =  self.sheetLb.font =  gateFont(14, Normal);
     self.timeLb.textColor =  self.jiduLb.textColor =   self.sheetLb.textColor =   self.tageLb.textColor =  gateColor(@"7e87a1");
    
//    self.tageLb.textColor = gateColor(@"74d5b4");
     self.tageLb.textColor = gateColor(@"f25676");
//      self.sheetLb.textColor = gateColor(@"7e87a1");
    self.titleLb.text =  self.typeLb.text =  self.moneyLb2.text =  self.moneyLb1.text =  @"BTC";
   
       
       
       self.timeLb.text =  self.jiduLb.text =  self.tageLb.text =  self.sheetLb.text =  @"10000";
}

@end
