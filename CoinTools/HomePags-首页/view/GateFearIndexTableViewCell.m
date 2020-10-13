//
//  GateFearIndexTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateFearIndexTableViewCell.h"
#import "ZZDottedLineProgress.h"
#import "GTPointerView.h"
@interface GateFearIndexTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIView *prgressView;
@property (weak, nonatomic) IBOutlet UILabel *yesterDayLb;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekLb;
@property (weak, nonatomic) IBOutlet UILabel *LastMonthLb;
@property (weak, nonatomic) IBOutlet UILabel *totayFearIndexLb;
@property (strong, nonatomic) GTPointerView * rr;
@end
@implementation GateFearIndexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    _progressView = [[ZZDottedLineProgress alloc] initWithFrame:CGRectMake(0, 0, 300, 300) startColor:[UIColor greenColor] endColor:[UIColor greenColor] startAngle:90 strokeWidth:4 strokeLength:20];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//          self.prgressView.startColor = [UIColor redColor];
//              self.prgressView.endColor = [UIColor orangeColor];
//              self.prgressView.startAngle = 90;
//              self.prgressView.strokeWidth = 10;
//            self.prgressView.strokeLength = 0;
//        //    self.prgressView.center = self.view.center;
//            //    _progressView.backgroundColor = [UIColor blackColor];
//                self.prgressView.roundStyle = YES;
//            //    _progressView.colorGradient = NO;
//                self.prgressView.showProgressText = YES;
//            //    _progressView.increaseFromLast = YES;
//            //    _progressView.notAnimated = YES;
//                self.prgressView.subdivCount = 90;
//            //    _progressView.animationDuration = 3;
//            //    _progressView.progress = 0.5;
//        //        [self.view addSubview:self.prgressView];
//            self.prgressView.pathBackColor  = [UIColor redColor];
//                   self.prgressView.backgroundColor  = [UIColor cyanColor];
//            self.prgressView.progress = 0.7;
//    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    GTPointerView * rr = [[GTPointerView alloc] initWithFrame:CGRectMake(0, 0, 150, 150/2)];
    [self.prgressView addSubview:rr];
    self.rr = rr;
    
    self.yesterDayLb.font = self.lastWeekLb.font = self.LastMonthLb.font = gateFont(14, Medium);
      self.titleLb.textColor = self.yesterDayLb.textColor = self.lastWeekLb.textColor = self.LastMonthLb.textColor =  gateColor(@"333B46");
   
     self.titleLb.font =  gateFont(16, Medium); self.timeLb.font =  gateFont(11, Normal);
    self.timeLb.text = @"于09-17 11：00更新"; self.titleLb.text = @"恐慌指数";
     self.timeLb.textColor = gateColor(@"6F6C6C");
   
  
    self.yesterDayLb.attributedText = [@"昨日：正常" getMutableAttributedStringWhitSearchString:@"正常" searchStringColor:gateColor(@"43b261") searchStringFont:self.yesterDayLb.font];
     self.lastWeekLb.attributedText = [@"上周：恐慌" getMutableAttributedStringWhitSearchString:@"恐慌" searchStringColor:gateColor(@"9A0076") searchStringFont:self.yesterDayLb.font];
     self.LastMonthLb.attributedText = [@"上月：极度贪梦" getMutableAttributedStringWhitSearchString:@"极度贪梦" searchStringColor:gateColor(@"ff0351") searchStringFont:self.yesterDayLb.font];
    
  
    self.tuiMg.image = getImage(@"homeImages/614143f48bb9b1f9175454d575009884@3x");
}

-(void)setHomevix:(GTHomevixModel *)homevix{
//    GTAlldatalistModel * alldatalistModel = homevix.alldatalist[0].datalist;
    self.rr.pointerRatio = [homevix.alldatalist[0].datalist.firstObject.content doubleValue]/100;
    self.totayFearIndexLb.text = homevix.alldatalist[0].datalist[1].content;
    [GTStyleManager setStyleWhit:homevix.alldatalist[0].datalist[1] forLale: self.totayFearIndexLb];
    
    
     [GTStyleManager setStyleWhit:homevix.alldatalist[1].title forLale: self.yesterDayLb];
    
    self.yesterDayLb.attributedText = [[NSString stringWithFormat:@"%@%@",homevix.alldatalist[1].title.content,homevix.alldatalist[1].datalist[1].content] getMutableAttributedStringWhitSearchString:homevix.alldatalist[1].datalist[1].content searchStringColor: gateColor([homevix.alldatalist[1].datalist[1].color isNotBlank]?homevix.alldatalist[1].datalist[1].color:@"333B46") searchStringFont: self.yesterDayLb.font];
    
    
    
    
    [GTStyleManager setStyleWhit:homevix.alldatalist[2].title forLale: self.lastWeekLb];
    
    self.lastWeekLb.attributedText = [[NSString stringWithFormat:@"%@%@",homevix.alldatalist[2].title.content,homevix.alldatalist[2].datalist[1].content] getMutableAttributedStringWhitSearchString:homevix.alldatalist[2].datalist[1].content searchStringColor: gateColor([homevix.alldatalist[2].datalist[1].color isNotBlank]?homevix.alldatalist[2].datalist[1].color:@"333B46") searchStringFont: self.yesterDayLb.font];
    
    [GTStyleManager setStyleWhit:homevix.alldatalist[3].title forLale: self.LastMonthLb];
       
       self.LastMonthLb.attributedText = [[NSString stringWithFormat:@"%@%@",homevix.alldatalist[3].title.content,homevix.alldatalist[3].datalist[1].content] getMutableAttributedStringWhitSearchString:homevix.alldatalist[3].datalist[1].content searchStringColor: gateColor([homevix.alldatalist[3].datalist[1].color isNotBlank]?homevix.alldatalist[3].datalist[1].color:@"333B46") searchStringFont: self.yesterDayLb.font];
       
    
  
   
}
@end
