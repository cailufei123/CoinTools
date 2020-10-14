//
//  GTFearIndexIndicatorTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/13.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTFearIndexIndicatorTableViewCell.h"
@interface GTFearIndexIndicatorTableViewCell()
@property(nonatomic,strong) CAShapeLayer * shapeLayer;

@property(nonatomic,strong) CAShapeLayer * shapeLayer1;
@property(nonatomic,strong) CAShapeLayer * shapeLayer2;
@end
@implementation GTFearIndexIndicatorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.totayFearIndexLb.font =  self.titleLb.font = gateFont(15, Medium);
    self.totayFearIndexLb.textColor =  self.titleLb.textColor = gateColor(@"44775a");
   
    self.shapeLayer1 = [self getShapeLayerWhit: gateColor(@"44775a") andRectMake:CGRectMake(0, 0, 100, 100)lineWidth:6];
    [self.IndicatorView.layer addSublayer:self.shapeLayer1];
    self.shapeLayer2 = [self getShapeLayerWhit: gateColor(@"44775a") andRectMake:CGRectMake(0, 0, 80, 80)lineWidth:2];
    [self.IndicatorView.layer addSublayer: self.shapeLayer2];
//    self.lineView.backgroundColor = gateColor(@"EEEEEE");
}
-(CAShapeLayer* )getShapeLayerWhit:(UIColor*)color andRectMake:(CGRect)rect lineWidth:(CGFloat)lineWidth{

       self.shapeLayer = [CAShapeLayer layer];
       self.shapeLayer.frame = rect;//设置shapeLayer的尺寸和位置
//      self.shapeLayer.position = self.IndicatorView.center;
     self.shapeLayer.position = CGPointMake(50, 50);
       self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor

       //设置线条的宽度和颜色
       self.shapeLayer.lineWidth = lineWidth;
       self.shapeLayer.strokeColor =   color.CGColor;

       //创建出圆形贝塞尔曲线
       UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:rect];

       //让贝塞尔曲线与CAShapeLayer产生联系
       self.shapeLayer.path = circlePath.CGPath;

       //添加并显示
      
     
     return self.shapeLayer;
}

//-(void)setHomevix:(GTHomevixModel *)homevix{
//    self.shapeLayer2.strokeColor = self.shapeLayer1.strokeColor = [homevix.alldatalist[0].datalist[0].color isNotBlank] ?gateColor(homevix.alldatalist[0].datalist[0].color).CGColor:gateColor(@"44775a").CGColor;
// 
//
//    
//    self.titleLb.text = homevix.alldatalist[0].datalist[0].content;
//      [GTStyleManager setStyleWhit:homevix.alldatalist[0].datalist[0] forLale: self.titleLb];
//    
//    self.totayFearIndexLb.text = homevix.alldatalist[0].datalist[1].content;
//    [GTStyleManager setStyleWhit:homevix.alldatalist[0].datalist[1] forLale: self.totayFearIndexLb];
//    
//    
//    
//    
//    self.yesterDayTitleLb.text = homevix.alldatalist[1].title.content;
//       [GTStyleManager setStyleWhit:homevix.alldatalist[1].title forLale: self.yesterDayTitleLb];
//    
//    
//    self.yesterDayLb.text = homevix.alldatalist[1].datalist[1].content;
//     [GTStyleManager setStyleWhit:homevix.alldatalist[1].datalist[1] forLale: self.yesterDayLb];
//    
//    
//    
//      self.lastWeekTitleLb.text = homevix.alldatalist[2].title.content;
//    [GTStyleManager setStyleWhit:homevix.alldatalist[2].title forLale: self.lastWeekTitleLb];
//    
//    self.lastWeekLb.text = homevix.alldatalist[2].datalist[1].content;
//     [GTStyleManager setStyleWhit: homevix.alldatalist[2].datalist[1] forLale: self.lastWeekTitleLb];
//    
//    
//    
//    
//    [GTStyleManager setStyleWhit:homevix.alldatalist[3].title forLale: self.LastMonthLb];
//       
//    
//      self.LastMonthTitleLb.text = homevix.alldatalist[3].title.content;
//     [GTStyleManager setStyleWhit:homevix.alldatalist[3].title forLale: self.LastMonthTitleLb];
//    
//       self.LastMonthLb.text = homevix.alldatalist[3].datalist[1].content;
//       
//    [GTStyleManager setStyleWhit:homevix.alldatalist[3].datalist[1] forLale: self.LastMonthLb];
//  
//   
//}
@end
