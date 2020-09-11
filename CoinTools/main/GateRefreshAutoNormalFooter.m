//
//  GateRefreshAutoStateFooter.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateRefreshAutoNormalFooter.h"

@implementation GateRefreshAutoNormalFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)prepare
{
    [super prepare];
  self.triggerAutomaticallyRefreshPercent = -2;
  [self setTitle:@"正在加载更多..." forState:MJRefreshStateRefreshing];
     [self setTitle:@"没有了" forState:MJRefreshStateNoMoreData];

}


@end
