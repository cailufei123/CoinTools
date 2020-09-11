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
   
    
  
}
-(void)layoutSubviews{
    [super layoutSubviews];
      [self viewShadowPathWithColor:[UIColor grayColor] shadowOpacity:0.5 shadowRadius:1 shadowPathType:LeShadowPathAround shadowPathWidth:1];
}

@end
