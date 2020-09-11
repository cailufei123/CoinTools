//
//  GateHearView.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHearView.h"
#import "Masonry.h"
@interface GateHearView()

@end
@implementation GateHearView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
        [self LayoutView];
    }
    return self;
}
-(void)createView{
    
}
+(GateHearView * )getGateHearView{
    GateHearView *hearView = [[self alloc] init];
    return hearView;
}
-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.text = @"BTC爆仓数据";
        _nameLb.textColor = gateColor(hearTitleColor);
          _nameLb.font = gateFont(18, Medium);
        [self addSubview:_nameLb];
    }
     return _nameLb;
}
-(UIButton *)moreBt{
    if (!_moreBt) {
        _moreBt = [[UIButton alloc] init];
        [_moreBt setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBt setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _moreBt.titleLabel.textColor =  gateColor(@"606060");
//        _moreBt.backgroundColor = [UIColor redColor];
        _moreBt.titleLabel.font = gateFont(14, Normal);
        [self addSubview:_moreBt];
    }
     return _moreBt;
}
-(void)LayoutView{
    [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
    }];
    [self.moreBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self);
    }];
}
@end
