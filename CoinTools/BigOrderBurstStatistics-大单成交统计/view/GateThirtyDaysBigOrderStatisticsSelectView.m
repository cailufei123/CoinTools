//
//  GateThirtyDaysBigOrderStatisticsSelectView.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateThirtyDaysBigOrderStatisticsSelectView.h"

@interface GateThirtyDaysBigOrderStatisticsSelectView ()
@property(nonatomic,strong) UISegmentedControl *segment;
@end

@implementation GateThirtyDaysBigOrderStatisticsSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = gateColor(@"f6f9f9");
        [self createSegmentedControl];
         [self segmentedControlLyout];
    }
    return self;
}
-(void)segmentedControlLyout{
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
         make.height.mas_equalTo(30);
         make.width.mas_equalTo(120);
    }];
}

-(void)createSegmentedControl{
    NSArray *array = [NSArray arrayWithObjects:@"合约",@"现货", nil];
    //初始化UISegmentedControl
    self.segment = [[UISegmentedControl alloc]initWithItems:array];
   //根据下标修改分段标题(修改下标为2的分段)
//      [self.segment setTitle:@"巧克力" forSegmentAtIndex:2];
   //根据内容定分段宽度
   
//      self.segment.apportionsSegmentWidthsByContent = YES;
    //开始时默认选中下标(第一个下标默认是0)
      self.segment.selectedSegmentIndex = 0;
   //控件渲染色(也就是外观字体颜色)
       self.segment.tintColor = gateColor(@"5064f2");
     self.segment.selectedSegmentTintColor = [UIColor redColor];
    self.segment.backgroundColor = [UIColor whiteColor];
   //按下是否会自动释放：
       //segment.momentary = YES;
    //添加到视图
  [self.segment segmentedIOS13Style];
    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
   

    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:gateColor(@"5064f2")} forState:UIControlStateNormal];

  
//
    [self addSubview: self.segment];
     [self.segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
}
//点击不同分段就会有不同的事件进行相应
-(void)change:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        !_selectblock?:_selectblock(0);
    }else if (sender.selectedSegmentIndex == 1){
        !_selectblock?:_selectblock(1);
    }else{
        NSLog(@"4");
    }
    
}
@end

