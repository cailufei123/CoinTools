//
//  GTPointerView.m
//  CoinTools
//
//  Created by MAC on 2020/9/18.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTPointerView.h"
//#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
 #define degreesToRadians(degrees) ((degrees * (float)M_PI) / 180.0f)  //这个公式是计算弧度的
//  #define degreesToRadians(degrees) ((degrees * (float)M_PI) / 180.0f)
@interface GTPointerView()
@property(nonatomic,strong) UIView * bg;

@property (nonatomic, strong) CAShapeLayer *shapeLayer1;
@property (nonatomic, strong) CAShapeLayer *bottomLayer; // 进度条底色
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer; // 渐变进度条
@property (nonatomic, strong) UIImageView *markerImageView; // 光标
@property (nonatomic, strong) UIImageView *bgImageView; // 背景图片
@property (nonatomic, strong) UILabel *commentLabel; // 中间文字label

@property (nonatomic, assign) CGFloat circelRadius; //圆直径
@property (nonatomic, assign) CGFloat lineWidth; // 弧线宽度
@property (nonatomic, assign) CGFloat stareAngle; // 开始角度
@property (nonatomic, assign) CGFloat endAngle; // 结束角度

@property (nonatomic, assign) CGFloat oldEndAngle; // 记录的旧的结束角度

@property (nonatomic, assign) CGFloat percent; // 百分比 0 - 100

@property (nonatomic, strong) UIImageView *typeImageView; // 模式图片
@property (nonatomic, strong)  UIView * pointer;

@end
@implementation GTPointerView
//-(void)awakeFromNib{
//    [super awakeFromNib];
//
//    [self initialization];
//    [self createBageView];
//     [self lyoutBageView];
//      [self initSubView];
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self initialization];
        [self createBageView];
         [self lyoutBageView];
          [self initSubView];
        
       [UIView animateWithDuration:2 animations:^{
           self.pointer.transform = CGAffineTransformMakeRotation(M_PI * 1.6);
        }];
            
    }
    return self;
}
//-(void)layoutSubviews{
//    [super layoutSubviews];
//    
//      [self initialization];
//      [self createBageView];
//       [self lyoutBageView];
//        [self initSubView];
//}
  
-(void)createBageView{
    
    self.bg = [[UIView alloc] initWithFrame:self.bounds];
//     self.bg.backgroundColor = [UIColor cyanColor];
    [self addSubview: self.bg];
//     [self.bg addSubview:titl];
    
    
 
    
  


    

      float dist =  (self.circelRadius+25)/2 ;//半径

      for (int i= 0; i<5;i++) {

          float angle = degreesToRadians((180 / 4) * i) + degreesToRadians(90) ;

          float y = cos(angle) * dist;

          float x = sin(angle) * dist;

          UILabel * titl = [[UILabel alloc] init];
          titl.size = CGSizeMake(20, 12);
          titl.font = gateFont(12, Normal);
          titl.text = [NSString stringWithFormat:@"%d",100 - 100/4 * i];
            titl.textAlignment = NSTextAlignmentCenter;
            titl.textColor = gateColor(@"000000");
          
//            titl.backgroundColor = [UIColor redColor];
//
//          UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//          btn.width = 30;
//
//          btn.height = 30;
//
//          btn.layer.cornerRadius = 30;
//
//          btn.layer.masksToBounds = YES;
//
//          [btn setBackgroundColor:[UIColor whiteColor]];

          

          CGPoint center = CGPointMake(self.bg.width/2 + x,self.bg.height + y);
//  CGPoint center = CGPointMake(x, y);
          titl.center = center;

         

          [self.bg addSubview:titl];



      }


    
    
}
-(void)lyoutBageView{
//    [self]
}
-(void)initialization{
    self.circelRadius = self.frame.size.width-30;
    self.lineWidth = 10.f;
    self.stareAngle = -180.f;
    self.endAngle = 0.f;
    
}
-(CAShapeLayer *)shapeLayer1{
    if (!_shapeLayer1) {
        _shapeLayer1 = [CAShapeLayer layer];
    }
    return _shapeLayer1;
}

- (void)initSubView {


            UIView * dort = [[UIView alloc] init];
            dort.size = CGSizeMake(15, 15);
            dort.backgroundColor = [UIColor redColor];
            [self addSubview:dort];
            dort.center = self.center;
            dort.layer.masksToBounds = YES;
    dort.clf_centerY = self.height;
    dort.layer.cornerRadius = dort.size.height/2;

    UIView * line = [[UIView alloc] init];self.pointer = line;
                                 line.size = CGSizeMake( self.circelRadius/2-10, 15);
                UIBezierPath *path1 = [[UIBezierPath alloc] init];
             
                [ path1 moveToPoint:CGPointMake(0, 5)];
    [ path1 addLineToPoint:CGPointMake(line.size.width, 10)];
                   [ path1 addLineToPoint:CGPointMake(0, 10)];
                  
                   [ path1 closePath];

                 self.shapeLayer1.path =  path1.CGPath;
            //    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //            self.shapeLayer.fillColor = [firstColor colorWithAlphaComponent:1].CGColor;
    //            self.shapeLayer.path =  path1.CGPath;
                
               
               
            
          
                   line.backgroundColor = [UIColor redColor];
                   [self addSubview:line];
            [line.layer setMask: self.shapeLayer1];
                   line.center = dort.center;
            line.layer.position = CGPointMake(self.bounds.size.height, self.bounds.size.width/2);
            line.layer.anchorPoint = CGPointMake(0, 0.5);
    //        line.transform = CGAffineTransformRotate(line.transform, -M_PI_4);
              line.transform = CGAffineTransformMakeRotation(M_PI);
           
    
    
    
    
    
    
    
    
    
    // 圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width / 2, self.height)
                                                        radius:(self.circelRadius - self.lineWidth) / 2
                                                    startAngle:degreesToRadians(self.stareAngle)
                                                      endAngle:degreesToRadians(self.endAngle)
                                                     clockwise:YES];
    
    // 底色
    self.bottomLayer = [CAShapeLayer layer];
    self.bottomLayer.frame = self.bounds;
    self.bottomLayer.fillColor = [[UIColor clearColor] CGColor];
    self.bottomLayer.strokeColor = [[UIColor  colorWithRed:206.f / 256.f green:241.f / 256.f blue:227.f alpha:1.f] CGColor];
      self.bottomLayer.strokeColor = [[UIColor orangeColor] CGColor];
    self.bottomLayer.opacity = 0.5;
//    self.bottomLayer.lineCap = kCALineCapRound;
    self.bottomLayer.lineWidth = self.lineWidth;
    self.bottomLayer.path = [path CGPath];
    [self.layer addSublayer:self.bottomLayer];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    self.progressLayer.strokeColor  = [[UIColor whiteColor] CGColor];
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineWidth = self.lineWidth;
    self.progressLayer.path = [path CGPath];
    self.progressLayer.strokeEnd = 0;
    self.progressLayer.strokeEnd =1;
//    [self.bottomLayer setMask:self.progressLayer];
    
    
    
    
    
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.bounds;
    [self.gradientLayer setColors:[NSArray arrayWithObjects:
                                   (id)[[UIColor blueColor] CGColor],
                                   [(id)[UIColor redColor] CGColor],

                                   nil]];
    [self.gradientLayer setLocations:@[@0, @1]];
    [self.gradientLayer setStartPoint:CGPointMake(0, 0)];
    [self.gradientLayer setEndPoint:CGPointMake(1, 0)];
    [self.gradientLayer setMask:self.progressLayer];
//
    [self.layer addSublayer:self.gradientLayer];
    
    // 240 是用整个弧度的角度之和 |-200| + 20 = 270

    
}

@end
