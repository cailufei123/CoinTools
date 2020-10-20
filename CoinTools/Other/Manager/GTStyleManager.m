//
//  GTStyleManager.m
//  CoinTools
//
//  Created by MAC on 2020/10/12.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTStyleManager.h"

@implementation GTStyleManager
+(void)setStyleWhit:(GTHomeTitleModel *)homeTitleModel forLale:(UILabel *)contentLb{
    if ([homeTitleModel.color isNotBlank]) {
        contentLb.textColor = gateColor(homeTitleModel.color);
    }
    if (homeTitleModel.size) {
        contentLb.font = gateFont(homeTitleModel.size, homeTitleModel.blod == YES? Medium: Normal);
       }
    
   
   
}
+(void)loadingImage{
    [EasyLodingView showLodingText:@"" imageName:getImageName(@"loading_0_30x30_@3x") config:^EasyLodingConfig *{
        return [EasyLodingConfig shared].setLodingType(LodingShowTypeImageAround).setTintColor(UIColor.redColor).setBgColor([[UIColor grayColor] colorWithAlphaComponent:0.2]);
    }];
}
@end
