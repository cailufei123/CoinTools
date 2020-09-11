//
//  pressView.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "pressView.h"
#import "Masonry.h"
#define  totolWidth self.frame.size.width
#define  totolHeight self.frame.size.height
@interface pressView()
@property(nonatomic,strong)UIView * pressV;
@property(nonatomic,strong) CAShapeLayer * shapeLayer1 ;
@property(nonatomic,strong) CAShapeLayer * shapeLayer2 ;

@property(nonatomic,strong) UILabel * cnterLb;
@property(nonatomic,strong) UILabel * placeholderLb;
@end


@implementation pressView
-(void)awakeFromNib{
    [super awakeFromNib];
    [self craetView];
   
    [self layoutView];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self craetView];
        [self addSubview:self.pressV];
       
         [self layoutView];
        [self setPlaceholderView];
       
    }
    return self;
}
-(void)setPlaceholderView{
    [self addSubview: self.placeholderLb];
}
-(UILabel *)placeholderLb{
    if (!_placeholderLb) {
        _placeholderLb = [[UILabel alloc] initWithFrame:self.frame];
        _placeholderLb.text = @"暂无数据";
        _placeholderLb.backgroundColor = gateColor(@"f9fafb");
        _placeholderLb.textColor = gateColor(@"a6b5ca");
        _placeholderLb.textAlignment = NSTextAlignmentCenter;
        _placeholderLb.font = gateFont(14, Normal);
    }
    return _placeholderLb;
}
-(UIView *)pressV{
    if (!_pressV) {
        _pressV = [[UIView alloc] initWithFrame:self.frame];
       
        CAShapeLayer * shapeLayer1 = [self creatBezierPath1:0.0 lastColor:gateColor(@"549aef")];

        CAShapeLayer * shapeLayer2 = [self creatBezierPath2:0.0 lastColor:gateColor(@"e04d5a")];
         [_pressV.layer addSublayer:shapeLayer1];
         [_pressV.layer addSublayer:shapeLayer2];
        
    }
    return _pressV;
}


-(void)updataPrgress:(CGFloat)prgress{
    [self creatBezierPath1:prgress lastColor:gateColor(@"549aef")];
           
    [self creatBezierPath2:1-prgress lastColor:gateColor(@"e04d5a")];
    self.placeholderLb.hidden = YES;
    if (prgress>=1) {
        self.cnterLb.hidden = YES;
        self.fisrtLb.hidden = NO;
        self.lastLb.hidden = YES;
         self.placeholderLb.hidden = NO;
    }else if(prgress<=0){
        self.cnterLb.hidden = YES;
        self.fisrtLb.hidden = YES;
        self.lastLb.hidden = NO;
        self.placeholderLb.hidden = NO;
    }else{
        self.fisrtLb.hidden = NO;
        self.lastLb.hidden = NO;
        self.cnterLb.hidden = NO;
    }
   
    
   
       self.cnterLb.text = @"空";
    [self.cnterLb mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(prgress * (totolWidth-30)+2 );
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
//    [self.pressV layoutIfNeeded];
     [self.pressV setNeedsDisplay];
}
-(CAShapeLayer *)shapeLayer1{
    if (!_shapeLayer1) {
        _shapeLayer1 = [CAShapeLayer layer];
    }
    return _shapeLayer1;
}
-(CAShapeLayer *)shapeLayer2{
    if (!_shapeLayer2) {
        _shapeLayer2 = [CAShapeLayer layer];
    }
    return _shapeLayer2;
}

-(UILabel *)fisrtLb{
    if (!_fisrtLb) {
        _fisrtLb = [[UILabel alloc] init];;
        _fisrtLb.font = gateFont(16, Normal);
        _fisrtLb.textColor = gateColor(@"ffffff");
        [self addSubview:_fisrtLb];
    }
    return _fisrtLb;
}
-(UILabel *)lastLb{
    if (!_lastLb) {
        _lastLb = [[UILabel alloc] init];;
       _lastLb.font = gateFont(16, Normal);
        _lastLb.textColor = gateColor(@"ffffff");
         [self addSubview:_lastLb];
    }
    
    return _lastLb;
}
-(UILabel *)cnterLb{
    if (!_cnterLb) {
        _cnterLb = [[UILabel alloc] init];;
        _cnterLb.backgroundColor = [UIColor whiteColor];
        _cnterLb.layer.masksToBounds = YES;
        _cnterLb.textAlignment = NSTextAlignmentCenter;
          _cnterLb.layer.cornerRadius = 15;
        _cnterLb.font = gateFont(18, Medium);
        _cnterLb.textColor = gateColor(@"e04d5a");
        [self addSubview:_cnterLb];
    }
    return _cnterLb;
}

-(void)layoutView{
    [self.pressV mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(self).offset(0);

           make.left.mas_equalTo(self).offset(0);

           make.right.mas_equalTo(self).offset(-0);

           make.bottom.mas_equalTo(self);
       }];
    [self.fisrtLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(10);
    }];
    [self.cnterLb mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerY.mas_equalTo(self);
           make.left.mas_equalTo(self).offset(10);
//          make.centerX.mas_equalTo(1);
        make.height.mas_equalTo(30);
         make.width.mas_equalTo(30);
    }];
    [self.lastLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(-10);
    }];
}

-(CAShapeLayer *)creatBezierPath1:(CGFloat)firstPres  lastColor:(UIColor * )firstColor{
    if (firstPres<0 || firstPres>1) {
        firstPres = 0;
    }
    CGFloat orgin = (firstPres>=1 || firstPres<=0)?0:3;
    
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [ path1 moveToPoint:CGPointMake(0, 0)];
    [ path1 addLineToPoint:CGPointMake(firstPres * totolWidth + orgin, 0)];
    [ path1 addLineToPoint:CGPointMake(firstPres * totolWidth - orgin, self.frame.size.height)];
    [path1 addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [ path1 closePath];

    self.shapeLayer1.fillColor = [firstColor colorWithAlphaComponent:01].CGColor;
    self.shapeLayer1.path =  path1.CGPath;
    
   
   
    return self.shapeLayer1;
}
-(CAShapeLayer *)creatBezierPath2:(CGFloat)lastPres  lastColor:(UIColor * )lastColor{
     CGFloat orgin = (lastPres>=1 || lastPres<=0)?0:8;
     CGFloat orgin1 = (lastPres>=1 || lastPres<=0)?0:3;
    if (lastPres>1) {
           lastPres = 1;
       }
    if (lastPres<0) {
        lastPres = 0;
    }
    UIBezierPath * path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(totolWidth - (lastPres * totolWidth  - orgin) , 0)];
    [path addLineToPoint:CGPointMake(totolWidth , 0)];
    [path  addLineToPoint:CGPointMake(totolWidth , totolHeight)];
    [path addLineToPoint:CGPointMake(totolWidth - (lastPres * totolWidth  - orgin1) , totolHeight)];
    [path closePath];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer2.fillColor = [lastColor colorWithAlphaComponent:1].CGColor;
           self.shapeLayer2.path = path.CGPath;
    return self.shapeLayer2;
}
-(void)craetView{
//    self.pressV;
   
    
    
    
    
  
//
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
}
@end
