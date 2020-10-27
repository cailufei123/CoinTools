//
//  GateTopSelectView.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateTopSelectView.h"
@interface GateTopSelectView()

@end
@implementation GateTopSelectView

- (instancetype)initWithFrame:(CGRect)frame categoryTitleViewStyle:(CategoryTitleViewStyle)categoryTitleViewStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.categoryTitleViewStyle = categoryTitleViewStyle;
        [self createCategoryView];
          [self addSubview:self.lineView];
    }
    return self;
}
-(void)createCategoryView{
  
      self.categoryView.titles = self.titles;
    [self addSubview:self.categoryView];
    
  
}

-(UIView *)lineView{
    if (!_lineView) {
      
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, scrWeiht , 1)];
        _lineView.backgroundColor = gateColor(@"ededed");
        _lineView.hidden = YES;
    }
    return _lineView;
}
-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.categoryView.titles = titles;
    [self.categoryView reloadData];
}
- (JXCategoryTitleView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, self.clf_width, self.clf_height)];
        _categoryView.delegate = self;
        _categoryView.backgroundColor  =[UIColor whiteColor];
        _categoryView.titleColor = gateColor(gateDefaultColor);
         _categoryView.titleSelectedColor = gateColor(gateSelectColor);
         _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleFont = gateFont(14, Normal);
         _categoryView.titleSelectedFont = gateFont(14, Normal);
        _categoryView.averageCellSpacingEnabled = NO;
        [_categoryView viewShadowPathWithColor:gateColor(@"f2f2f3") shadowOpacity:0.5 shadowRadius:6 shadowPathType:LeShadowPathBottom shadowPathWidth:8];
  JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        switch (self.categoryTitleViewStyle) {
            case CategoryStyleDefault:
             
               lineView.indicatorColor = gateColor(@"c82728");
               lineView.indicatorWidth = 50;
               _categoryView.indicators = @[lineView];
                break;
            case CategoryZoomScale:
          
          _categoryView.titleColorGradientEnabled = YES;
          _categoryView.titleLabelZoomEnabled = YES;
          _categoryView.titleLabelZoomScale = 1.2;
//          _categoryView.titleLabelStrokeWidthEnabled = YES;
          _categoryView.selectedAnimationEnabled = YES;
             break;
            default:
                break;
        }
      
   
   

    }
    return _categoryView;
}
#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    !_selectBlock?:_selectBlock(index,_titles[index]);
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
