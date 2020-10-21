//
//  GateData1TableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateData1TableViewCell.h"
@interface GateData1TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *oneTitleLb;

@property (weak, nonatomic) IBOutlet UILabel *one_amt_chLb;
@property (weak, nonatomic) IBOutlet UILabel *one_amt_usLb;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *amt_chLb;
@property (weak, nonatomic) IBOutlet UILabel *amt_usLb;
@end
@implementation GateData1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.oneTitleLb.font = gateFont(15, Normal);
    self.one_amt_chLb.font = gateFont(18, Medium);
    self.one_amt_usLb.font = gateFont(15, Normal);
    
    self.titleLb.font = gateFont(15, Normal);
       self.amt_chLb.font = gateFont(18, Medium);
       self.amt_usLb.font = gateFont(15, Normal);
   
}

//-(void)setH_burst_amtModel:(GateH_burst_amtModel *)h_burst_amtModel{
    
    // value 为 y 轴的值
      
//   
//    
//    self.oneTitleLb.text = @"1H爆仓";
//    self.one_amt_chLb.text = [NSString stringWithFormat:@"%@",[self getFomterNumber:h_burst_amtModel.h_burst_amt_ch1]];
//    self.one_amt_usLb.text =[NSString stringWithFormat:@"%@" ,[self getFomterNumber:h_burst_amtModel.h_burst_amt_us1]];
//    
//    self.titleLb.text = @"24H爆仓";
//    self.amt_chLb.text = [NSString stringWithFormat:@"%@",[self getFomterNumber:h_burst_amtModel.h_burst_amt_ch24]];
//    self.amt_usLb.text =[NSString stringWithFormat:@"%@" ,[self getFomterNumber:h_burst_amtModel.h_burst_amt_us24]];
//    
//    
    
//}

-(NSString *)getFomterNumber:(NSString *)value{
     NSString * moneyStr = @"0";
    if (value.doubleValue>=100000000){
                 moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value.doubleValue * 0.00000001];
              }else  if (value.doubleValue>=10000) {
                        moneyStr = [NSString stringWithFormat:@"%0.2lf万",value.doubleValue * 0.0001];
              }else {
                 moneyStr = [NSString stringWithFormat:@"%0.2lf",value.doubleValue * 0.001];
                
            }
    return moneyStr;
}
@end
