//
//  GateHoursSelectView.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHoursSelectCategoryView.h"

@interface GateHoursSelectCategoryView()

@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UIView *topLineView;
@end
@implementation GateHoursSelectCategoryView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createTitleLable];
        [self addSubview:[self categoryView]];
        [self addSubview:self.lineView];
         [self lyoutCategoryView];
    }
    return self;
}
-(void)createTitleLable{
    self.titleLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150, 50)];
    self.titleLb.textAlignment =  NSTextAlignmentLeft;
    self.titleLb.text = @"交易所爆仓统计";
    self.titleLb.font = gateFont(15, Medium);
    self.titleLb.textColor =gateColor(@"303756");
    [self addSubview:self.titleLb];
}
-(void)setTitle:(NSString *)title{
      self.titleLb.text = title;
}
-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.categoryView.titles = self.titles;
    [self.categoryView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(titles.count * (150/4)+20 );
         make.width.mas_equalTo(titles.count * 40 );
    }];
    [self.categoryView reloadData];
}
-(UIView *)lineView{
    if (!_lineView) {
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, scrWeiht , 0.5)];
        _lineView.backgroundColor = gateColor(@"f3f2f8");
    }
    return _lineView;
}

-(UIView *)topLineView{
    if (!_topLineView) {
        
        _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht , 10)];
        _topLineView.backgroundColor = gateColor(@"f5faf9");
        [self addSubview:_topLineView];
    }
    return _topLineView;
}
- (JXCategoryTitleBackgroundView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[JXCategoryTitleBackgroundView alloc] initWithFrame:CGRectMake( self.titleLb.clf_right + 5, 0, 100, self.height)];
        _categoryView.delegate = self;
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.titleColor = gateColor(@"a2acc8");
        _categoryView.titleSelectedColor = gateColor(@"ffffff");
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleFont = gateFont(12, Normal);
        _categoryView.titleSelectedFont = gateFont(12, Normal);
        _categoryView.titleLabelAnchorPointStyle = JXCategoryTitleLabelAnchorPointStyleCenter;
        _categoryView.averageCellSpacingEnabled = NO;
        _categoryView.contentEdgeInsetLeft = 0;
        _categoryView.contentEdgeInsetRight = 0;
        _categoryView.cellSpacing = 10;
        _categoryView.cellWidth = 20;
//JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
//     backgroundView.indicatorHeight = 20;
//        backgroundView.indicatorColor = [UIColor blueColor];
//     backgroundView.indicatorCornerRadius = 4;
//
//     backgroundView.scrollEnabled = NO;
//        JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
//             backgroundView.indicatorHeight = 20;
//                backgroundView.indicatorColor = [UIColor blueColor];
//             backgroundView.indicatorCornerRadius = 4;
//
//             backgroundView.scrollEnabled = NO;
        
//     _categoryView.indicators = @[backgroundView];
       
    }
    
    
  
     
    return _categoryView;
}
-(void)lyoutCategoryView{
    
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(scrWeiht);
    }];
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.centerY.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(150);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
         
        make.centerY.mas_equalTo(self.categoryView);
        make.left.mas_equalTo(15);
        
       }];
  
      [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
         
          make.height.mas_equalTo(1);
           make.right.mas_equalTo(0);
          make.left.mas_equalTo(0);
          make.bottom.mas_equalTo(self).offset(-1);
             
        }];
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

