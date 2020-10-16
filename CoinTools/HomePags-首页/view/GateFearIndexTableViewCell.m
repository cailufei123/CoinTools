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


@property (weak, nonatomic) IBOutlet UIView *prgressView;
@property (weak, nonatomic) IBOutlet UILabel *yesterDayLb;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekLb;
@property (weak, nonatomic) IBOutlet UILabel *LastMonthLb;
@property (weak, nonatomic) IBOutlet UILabel *totayFearIndexLb;
@property (strong, nonatomic) GTPointerView * rr;


@property (weak, nonatomic) IBOutlet UILabel *yesterDayLb1;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekLb11;
@property (weak, nonatomic) IBOutlet UILabel *LastMonthLb1;

@end
@implementation GateFearIndexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    GTPointerView * rr = [[GTPointerView alloc] initWithFrame:CGRectMake(0, 0, 150, 150/2)];
    [self.prgressView addSubview:rr];
    self.rr = rr;
    
    self.yesterDayLb1.font = self.lastWeekLb11.font = self.LastMonthLb1.font = self.yesterDayLb.font = self.lastWeekLb.font = self.LastMonthLb.font = gateFont(14, Medium);
    
    self.yesterDayLb1.textColor = self.lastWeekLb11.textColor = self.LastMonthLb1.textColor =  self.titleLb.textColor = self.yesterDayLb.textColor = self.lastWeekLb.textColor = self.LastMonthLb.textColor =  gateColor(@"333B46");
   
     self.titleLb.font =  gateFont(16, Medium); self.timeLb.font =  gateFont(11, Normal);
    self.timeLb.text = @"于09-17 11：00更新"; self.titleLb.text =  [GTDataManager getLanguageData:@"kongHuangZhiShu"];
     self.timeLb.textColor = gateColor(@"6F6C6C");
   
  
    self.yesterDayLb.attributedText = [@"昨日：正常" getMutableAttributedStringWhitSearchString:@"正常" searchStringColor:gateColor(@"43b261") searchStringFont:self.yesterDayLb.font];
     self.lastWeekLb.attributedText = [@"上周：恐慌" getMutableAttributedStringWhitSearchString:@"恐慌" searchStringColor:gateColor(@"9A0076") searchStringFont:self.yesterDayLb.font];
     self.LastMonthLb.attributedText = [@"上月：极度贪梦" getMutableAttributedStringWhitSearchString:@"极度贪梦" searchStringColor:gateColor(@"ff0351") searchStringFont:self.yesterDayLb.font];
    
  
    self.tuiMg.image = getImage(@"homeImages/614143f48bb9b1f9175454d575009884@3x");
}

-(void)setHomevix:(GTHomevixModel *)homevix{
    
  

    self.rr.pointerRatio = [[GTDataManager getItemModelWhit:homevix.alldatalist[0].datalist.firstObject].firstObject.content doubleValue]/100;
    
    self.totayFearIndexLb.text = [GTDataManager getItemModelWhit:homevix.alldatalist[0].datalist.lastObject].lastObject.content ;
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:homevix.alldatalist[0].datalist.lastObject].lastObject forLale: self.totayFearIndexLb];
   
    self.yesterDayLb1.text = [GTDataManager getItemModelWhit:homevix.alldatalist[1].datalist.lastObject].lastObject.content ;
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:homevix.alldatalist[1].datalist.lastObject].lastObject forLale: self.yesterDayLb1];
    
    self.lastWeekLb11.text = [GTDataManager getItemModelWhit:homevix.alldatalist[2].datalist.lastObject].lastObject.content ;
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:homevix.alldatalist[2].datalist.lastObject].lastObject forLale: self.lastWeekLb11];
    
    self.LastMonthLb1.text = [GTDataManager getItemModelWhit:homevix.alldatalist[3].datalist.lastObject].lastObject.content ;
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:homevix.alldatalist[3].datalist.lastObject].lastObject forLale: self.LastMonthLb1];
    

    
    self.yesterDayLb.text = homevix.alldatalist[1].title.content ;
    [GTStyleManager setStyleWhit: homevix.alldatalist[1].title forLale: self.yesterDayLb];
    
    self.lastWeekLb.text = homevix.alldatalist[2].title.content ;
    [GTStyleManager setStyleWhit:homevix.alldatalist[2].title forLale: self.lastWeekLb];
    
    self.LastMonthLb.text = homevix.alldatalist[3].title.content ;
    [GTStyleManager setStyleWhit:homevix.alldatalist[3].title forLale: self.LastMonthLb];
   
}
@end
