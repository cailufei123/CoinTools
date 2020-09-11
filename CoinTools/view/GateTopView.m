//
//  GateTopView.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateTopView.h"
@interface GateTopView()
@property(nonatomic,strong)UIButton * actionBut;
@end
@implementation GateTopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBut];
        [self lyoutBut];
    }
    return self;
}
-(void)createBut{
    self.actionBut = [[UIButton alloc] init];
 
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:@"合约 更多>>"];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont normalFontOfSize:20 WithFontType:Medium],NSForegroundColorAttributeName:gateColor(@"000000")};
    NSRange rang = [@"合约更多>>" rangeOfString:@"合约"];
   
    [attributedString addAttributes:dic range:rang];
    [self.actionBut setAttributedTitle:attributedString forState:UIControlStateNormal];
    [self.actionBut addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: self.actionBut];
}
-(void)lyoutBut{
               self.actionBut.titleLabel.font = [UIFont normalFontOfSize:13 WithFontType:Normal];
    [self.actionBut mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(-10);
           make.centerY.mas_equalTo(self);
       }];
      
}
-(void)action{
    
}
@end
