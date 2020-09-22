//
//  GTMenuSelectViewCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/18.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTMenuSelectViewCollectionViewCell.h"
@interface GTMenuSelectViewCollectionViewCell ()

@end
@implementation GTMenuSelectViewCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
         [self titleLbLyout];
    }
    return self;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor =  gateColor(@"000309");
        _titleLb.font = gateFont(12, Normal);
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLb];
    }
    return _titleLb;
}
-(void)titleLbLyout{
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.top.mas_offset(2);
         make.bottom.mas_offset(2);
    }];
}
@end
