//
//  GatePrgessTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GatePrgessTableViewCell.h"

 
@implementation GatePrgessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
        self.press = [[pressView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-30, 40)];

        [self.progressView addSubview: self.press];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [ self.press updataPrgress:[@"0.6" doubleValue]];
    });
        
}


//@property(nonatomic,copy) NSString *exchange;//" : "Okex",
//@property(nonatomic,copy) NSString *future_type;//" : "quarter",
//@property(nonatomic,copy) NSString *coin_type;//" : "BTC",
//@property(nonatomic,copy) NSString *time_type;//" : "5m",
//@property(nonatomic,copy) NSString *long_rate;//" : "0.7415",
//@property(nonatomic,copy) NSString *short_rate;//" : "0.2585"
-(void)setSpaceRatioSubvModel:(GTSpaceRatioSubvModel *)spaceRatioSubvModel{
    self.userNameLb.text = spaceRatioSubvModel.exchange;
//      [self.userImageView setImageWithURL:urlWhitString(spaceRatioSubvModel.logo_url) placeholder:hydeNormalUserImage];
      
      [ self.press updataPrgress:[spaceRatioSubvModel.short_rate doubleValue]];
      self.press.fisrtLb.text =[NSString stringWithFormat:@"%0.2lf%%",[spaceRatioSubvModel.short_rate doubleValue] * 100];
       self.press.lastLb.text =[NSString stringWithFormat:@"%0.2lf%%",[spaceRatioSubvModel.long_rate doubleValue] * 100];
}
@end
