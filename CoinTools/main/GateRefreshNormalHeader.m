//
//  GateRefreshNormalHeader.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateRefreshNormalHeader.h"

@implementation GateRefreshNormalHeader

- (void)prepare
{
    [super prepare];
  self.automaticallyChangeAlpha = YES;
  self.lastUpdatedTimeLabel.hidden = NO;
 
}
@end
