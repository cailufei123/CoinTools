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
                _categoryView.backgroundColor  =[UIColor whiteColor];
                _categoryView.titleColor = gateColor(gateDefaultColor);
                 _categoryView.titleSelectedColor = gateColor(gateSelectColor);
                 _categoryView.titleColorGradientEnabled = YES;
                _categoryView.titleFont = gateFont(14, Normal);
                 _categoryView.titleSelectedFont = gateFont(14, Normal);
                _categoryView.averageCellSpacingEnabled = NO;
                [_categoryView viewShadowPathWithColor:gateColor(@"f2f2f3") shadowOpacity:0.5 shadowRadius:6 shadowPathType:LeShadowPathBottom shadowPathWidth:8];
      

                     _categoryView.titleColorGradientEnabled = YES;
                     _categoryView.titleLabelZoomEnabled = YES;
                     _categoryView.titleLabelZoomScale = 1.2;
           //          _categoryView.titleLabelStrokeWidthEnabled = YES;
                     _categoryView.selectedAnimationEnabled = YES;
              
           
       
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
