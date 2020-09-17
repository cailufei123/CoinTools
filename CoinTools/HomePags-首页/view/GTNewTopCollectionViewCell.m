//
//  GTNewTopCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTNewTopCollectionViewCell.h"

@implementation GTNewTopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLb.font = gateFont(12, Normal);
    self.titleLb.textColor = gateColor(@"333333");
    
}
-(void)setTitleText:(NSString *)titleText{
    self.titleLb.text = titleText;
}
-(void)setTitleImage:(NSString *)titleImage{
    
     self.titleImageView.image = getImage(titleImage);
}
@end
