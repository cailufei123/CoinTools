//
//  GateXAxisValueFormatter.m
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateXAxisValueFormatter.h"

@implementation GateXAxisValueFormatter
/// 实现协议方法，返回 x 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {

   // value 为 x 轴的值
    GateDiffLineModel * diffLineModel = _possArr.firstObject;
    return [NSString stringWithFormat:@"%@",[ diffLineModel.line[(NSInteger)value] firstObject]];
}
+(instancetype)getGateXAxisValueFormatter{
    return  [[self alloc] init];
}

-(void)setPossArr:(NSArray<GateDiffLineModel *> *)possArr{
     _possArr = possArr;
}
@end
