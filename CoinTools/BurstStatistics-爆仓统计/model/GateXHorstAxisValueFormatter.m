//
//  GateXHorstAxisValueFormatter.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateXHorstAxisValueFormatter.h"
#import "GTBurstModel.h"
#import "NSDateFormatter+Category.h"
@implementation GateXHorstAxisValueFormatter


/// 实现协议方法，返回 x 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {

   // value 为 x 轴的值
    GTHomeTitleModel * homeTitleModel = self.publicArr[(int)value];
    
    return homeTitleModel.content;
}

+(instancetype)getGateXHorstAxisValueFormatter{
    return  [[self alloc] init];
}
-(void)setPublicArr:(NSArray *)publicArr{
    _publicArr = publicArr;
}

//-(NSString * )mm_ddDateFormat:(NSString * )dateStr{
//
//
// return [[NSDateFormatter mm_ddDateFormatter] stringFromDate:[[NSDateFormatter yyyy_MM_ddDateFormatter] dateFromString:dateStr]];
//
//}
@end
