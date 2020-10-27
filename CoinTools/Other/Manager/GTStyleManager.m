//
//  GTStyleManager.m
//  CoinTools
//
//  Created by MAC on 2020/10/12.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTStyleManager.h"
#import <CoinTools/CoinTools-Swift.h>
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
+(UIImage *)selecrDotStyle:(UIColor * )color {
  
    UIView * rr = [[UIView alloc] init];

    rr.layer.borderWidth = 1;
    rr.layer.cornerRadius = 3;
    rr.layer.masksToBounds = YES;
    rr.backgroundColor = [UIColor whiteColor];
    rr.size = CGSizeMake(6, 6);
 
    
    rr.layer.borderColor = color.CGColor;
    UIImage * ic  = [[UIImage convertViewToImage:rr]  wh_imageAddCornerWithRadius:rr.size.height/2 andSize:rr.size];
   
    return   ic;
  
}



+(GTChartPMarkerView * )getChartPMarkerViewWhit {
    
    GTChartPMarkerView * marker1 = [GTChartPMarkerView loadFromNib:@"GTChartPMarkerView"];
   
  @weakify(self)
    marker1.aleartType = GTChartPMarkerViewCalendarPermissionBaoCang;
    marker1.cycleSelectBlock = ^NSArray * _Nonnull(NSInteger index) {
         @strongify(self)
    
          return [NSArray array];
      };
 
    [marker1 layercornerRadius:5];
    marker1.alpha = 0.8;
    marker1.backgroundColor = [UIColor blackColor];
//    marker1.chartView =  self.chartView;
     marker1.offset = CGPointMake(10, 0);
//      self.chartView.marker = marker1;
//    marker1.xAxisValueFormatter = xAxisValueFormatter;

    return marker1;
}


@end
