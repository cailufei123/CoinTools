//
//  GTScreenBt.m
//  CoinTools
//
//  Created by MAC on 2020/11/5.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTScreenBt.h"

@implementation GTScreenBt

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

    [self setImage:getImage(@"gatesdk_drawable_icon_all_screen") forState:UIControlStateNormal];
    [self addTarget:self action:@selector(switchShapeAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)switchShapeAction:(UIButton * )sender{
    
    
    !_selectBlock?:_selectBlock(YES);
}
@end
