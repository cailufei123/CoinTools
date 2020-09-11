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
-(void)setLong_shortModel:(GateLong_shortModel *)long_shortModel{
  
    self.userNameLb.text = long_shortModel.long_short_type;
    [self.userImageView setImageWithURL:urlWhitString(long_shortModel.logo_url) placeholder:hydeNormalUserImage];
    
    [ self.press updataPrgress:[long_shortModel.short_rate doubleValue]];
    self.press.fisrtLb.text =[NSString stringWithFormat:@"%0.2lf%%",[long_shortModel.short_rate doubleValue] * 100];
     self.press.lastLb.text =[NSString stringWithFormat:@"%0.2lf%%",[long_shortModel.long_rate doubleValue] * 100];
}

@end
