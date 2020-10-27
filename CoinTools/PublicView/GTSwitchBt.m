//
//  GTSwitchBt.m
//  CoinTools
//
//  Created by MAC on 2020/10/27.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTSwitchBt.h"

@implementation GTSwitchBt
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBtUI];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setBtUI];
    
}
-(void)setBtUI{
    [self setTitle:@"柱状图" forState:UIControlStateNormal];
    [self setTitle:@"折线图" forState:UIControlStateSelected];
    [self setTitleColor:gateColor(@"ffffff") forState:UIControlStateNormal];
    [self setTitleColor:gateColor(@"a2acc8") forState:UIControlStateSelected];
    self.titleLabel.font = gateFont(12, Normal);
    self.backgroundColor = gateColor(@"5064f2");
    
    [self addTarget:self action:@selector(switchShapeAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)switchShapeAction:(UIButton * )sender{
    if (sender.isSelected) {
        sender.selected = NO;
        self.backgroundColor = gateColor(@"5064f2");
  
    }else{
        sender.selected = YES;
        self.backgroundColor = gateColor(@"f6f9fb");
 
    }
    
    
    !_selectBlock?:_selectBlock(sender.isSelected);
}
@end
