//
//  Gateffff.m
//  block-pro
//
//  Created by 蔡路飞 on 2020/8/29.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHearCategoryView.h"

@implementation GateHearCategoryView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          [self addSubview:[self categoryView]];
            self.titles = @[@"BTC差基", @"BTC持仓数"];
            self.categoryView.titles = self.titles;
            [self.categoryView reloadData];
    }
    return self;
}

- (JXCategoryTitleView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:self.frame];
        _categoryView.delegate = self;
        _categoryView.titleColor = gateColor(@"727272");
         _categoryView.titleSelectedColor = gateColor(hearTitleColor);
         _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleFont = gateFont(16, Medium);
         _categoryView.titleSelectedFont = gateFont(16, Medium);
        
       _categoryView.averageCellSpacingEnabled = NO;
           JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
           lineView.indicatorColor = gateColor(@"00d9c2");
           lineView.indicatorWidth = 20;
           _categoryView.indicators = @[lineView];
       
    }
    return _categoryView;
}


#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    !self->_selectblock?:self->_selectblock(index);
  
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
@end
