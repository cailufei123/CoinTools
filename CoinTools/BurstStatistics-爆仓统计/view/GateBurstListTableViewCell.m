//
//  GateBurstListTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstListTableViewCell.h"

@implementation GateBurstListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLb.font =  self.typeLb.font =  self.moneyLb2.font =  self.moneyLb1.font =  gateFont(14, Medium);
    self.titleLb.textColor =  self.typeLb.textColor =  self.moneyLb2.textColor =  self.moneyLb1.textColor =  gateColor(@"283862");
    
    
    self.timeLb.font =  self.jiduLb.font =  self.tageLb.font =  self.sheetLb.font =  gateFont(12, Normal);
     self.timeLb.textColor =  self.jiduLb.textColor =   self.sheetLb.textColor =   self.tageLb.textColor =  gateColor(@"7e87a1");

     self.tageLb.textColor = gateColor(@"f25676");

}
-(void)setBurstdtl:(GTPublicContentModel *)burstdtl{
    _burstdtl  = burstdtl;
   GTHomeTitleModel *homeTitleModel =  [GTDataManager getItemModelWhit:burstdtl.alldatalist[0].datalist[self.indexPath.item]].firstObject;
    
    GTHomeTitleModel *homeTitleModel1 =  [GTDataManager getItemModelWhit:burstdtl.alldatalist[1].datalist[self.indexPath.item]].firstObject;
  
    
    GTHomeTitleModel *homeTitleModel20=  [GTDataManager getItemModelWhit:burstdtl.alldatalist[2].datalist[self.indexPath.item]].firstObject;
    GTHomeTitleModel *homeTitleModel21 =  [GTDataManager getItemModelWhit:burstdtl.alldatalist[2].datalist[self.indexPath.item]].lastObject;
    
    
    GTHomeTitleModel *homeTitleModel30=  [GTDataManager getItemModelWhit:burstdtl.alldatalist[3].datalist[self.indexPath.item]].firstObject;
    GTHomeTitleModel *homeTitleModel31 =  [GTDataManager getItemModelWhit:burstdtl.alldatalist[3].datalist[self.indexPath.item]].lastObject;
    
    GTHomeTitleModel *homeTitleModel40=  [GTDataManager getItemModelWhit:burstdtl.alldatalist[4].datalist[self.indexPath.item]].firstObject;
    GTHomeTitleModel *homeTitleModel41 =  [GTDataManager getItemModelWhit:burstdtl.alldatalist[4].datalist[self.indexPath.item]].lastObject;
    
    [self.iocnImageView setImageWithURL:urlWhitString(homeTitleModel.url) placeholder:getPlaceholderImage];
    self.titleLb.text = homeTitleModel.content;
    [GTStyleManager setStyleWhit:homeTitleModel forLale: self.titleLb];
    
    self.timeLb.text = [self getDateStringWithTimestamp:homeTitleModel1.content] ;
    [GTStyleManager setStyleWhit:homeTitleModel1 forLale: self.timeLb];
    
   
    

    
    self.typeLb.text = homeTitleModel20.content;
    [GTStyleManager setStyleWhit:homeTitleModel20 forLale: self.typeLb];
    self.jiduLb.text = homeTitleModel21.content;
    [GTStyleManager setStyleWhit:homeTitleModel21 forLale: self.jiduLb];
    
    self.moneyLb1.text = homeTitleModel30.content;
    [GTStyleManager setStyleWhit:homeTitleModel30 forLale: self.moneyLb1];
    self.tageLb.text = homeTitleModel31.content;
    [GTStyleManager setStyleWhit:homeTitleModel31 forLale: self.tageLb];
    
    self.moneyLb2.text = homeTitleModel40.content;
    [GTStyleManager setStyleWhit:homeTitleModel40 forLale: self.moneyLb2];
    self.sheetLb.text = homeTitleModel41.content;
    [GTStyleManager setStyleWhit:homeTitleModel41 forLale: self.sheetLb];
    
    
}

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimestamp:(NSString *)str {
//    NSTimeInterval time = [str doubleValue]/1000; // 传入的时间戳str如果是精确到毫秒的记得要/1000
     NSTimeInterval time = [str doubleValue]; // 传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // 实例化一个NSDateFormatter对象
    // 设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM/dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
@end


