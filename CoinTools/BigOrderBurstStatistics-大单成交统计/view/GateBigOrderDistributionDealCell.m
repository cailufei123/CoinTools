//
//  GateBigOrderDistributionDealCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBigOrderDistributionDealCell.h"
#import "GatePublicSelectView.h"
@interface GateBigOrderDistributionDealCell ()
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;
@property(nonatomic,strong) GatePublicSelectView * bottomPublicSelectView;
@end
@implementation GateBigOrderDistributionDealCell

- (void)awakeFromNib {
    [super awakeFromNib];
   _chartView.delegate = self;
 
    _chartView.chartDescription.enabled = NO;
    _chartView.legend.enabled = NO; //是否有图例。默认YES
    _chartView.drawGridBackgroundEnabled = NO;
    _chartView.drawBarShadowEnabled = NO;
    _chartView.highlightFullBarEnabled = NO;
    _chartView.highlightPerDragEnabled = NO;
    _chartView.doubleTapToZoomEnabled = NO;
     _chartView.scaleYEnabled = NO;
     _chartView.scaleXEnabled = NO;
    _chartView.drawOrder = @[
                             @(CombinedChartDrawOrderBar),
                             @(CombinedChartDrawOrderBubble),
                             @(CombinedChartDrawOrderCandle),
                             @(CombinedChartDrawOrderLine),
                             @(CombinedChartDrawOrderScatter)
                             ];

  _chartView.rightAxis.enabled = NO;


    ChartYAxis *leftAxis = _chartView.leftAxis;
    //显示网格线。默认YES
          leftAxis.drawGridLinesEnabled = YES;
          //网格线的颜色
          leftAxis.gridColor = gateColor(gateGridColor);
          //网格线的宽度。默认0.5
          leftAxis.gridLineWidth = 1;
          leftAxis.gridLineDashPhase = 0;
          //网格线的虚线效果，间距值
          leftAxis.gridLineDashLengths = @[];
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    leftAxis.labelTextColor = gateColor(axislabelTextColor);
    ChartXAxis *xAxis = _chartView.xAxis;
//    xAxis.labelPosition = XAxisLabelPositionBothSided;
     xAxis.labelTextColor = gateColor(axislabelTextColor);
    
    xAxis.axisMinimum = 0.0;
      xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    xAxis.valueFormatter = self;
  xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelRotationAngle = 50;
 
    [self updateChartData];
    
    
    
    
  NSMutableArray * arr = [NSMutableArray array];
        
        for (int i = 0; i<3; i++) {
            GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
            if (i == 0) {
                selectModel.color = UIColor.redColor;
                selectModel.shape = square;
                 selectModel.titleText = @"多单";
            }
            if (i == 1) {
                selectModel.color = UIColor.greenColor;
                selectModel.shape = square;
                 selectModel.titleText =@"空单" ;
            }
            if (i == 2) {
                selectModel.color = UIColor.orangeColor;
                selectModel.shape = square;
                  selectModel.titleText =@"空单";
            }
            [arr addObject:selectModel];
    }
   
    [self.selectView addSubview:self.topPublicSelectView];
     self.topPublicSelectView.arr = arr;
      self.topPublicSelectView.selectIndex = 0;
     
       [self.bottomSelectView addSubview:self.bottomPublicSelectView];
       
      self.bottomPublicSelectView.arr = arr;
   
    [self.bottomPublicSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
          make.bottom.mas_offset(0);
         make.right.mas_offset(-15);
          make.left.mas_offset(15);
    }];
  
   [self.topPublicSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_offset(0);
         make.bottom.mas_offset(0);
        make.right.mas_offset(-15);
         make.left.mas_offset(15);
   }];
  
}
-(GatePublicSelectView *)bottomPublicSelectView{
    if (!_bottomPublicSelectView) {
        _bottomPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht, 30)];
        _bottomPublicSelectView.centerX = scrWeiht/2;
        _bottomPublicSelectView.checkboxEnabled = YES;
       
        
         @weakify(self)
        _bottomPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            @strongify(self)
                       BubbleChartDataSet * set =  (BubbleChartDataSet *) self.chartView.bubbleData.dataSets[index];
            set.visible = !publicSelectModel.selectEnabled;
                       [self.chartView setNeedsDisplay];
            
            
        };
        
     }
    return _bottomPublicSelectView;
}
-(GatePublicSelectView *)topPublicSelectView{
    if (!_topPublicSelectView) {
        _topPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht-60, 30)];
        _topPublicSelectView.centerX = scrWeiht/2;
        _topPublicSelectView.checkboxEnabled = NO;
         @weakify(self)
        _topPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            @strongify(self)
                       BubbleChartDataSet * set =  (BubbleChartDataSet *) self.chartView.bubbleData.dataSets[index];
            set.visible = !publicSelectModel.selectEnabled;
                       [self.chartView setNeedsDisplay];
        };
        
     }
    return _topPublicSelectView;
  }



- (void)updateChartData
{

    [self setChartData];
}
- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
    
    data.lineData = [self generateLineData];
//    data.barData = [self generateBarData];
    data.bubbleData = [self generateBubbleData];
//    data.scatterData = [self generateScatterData];
//    data.candleData = [self generateCandleData];
    
//    _chartView.xAxis.axisMaximum = data.xMax + 0.25;

    _chartView.data = data;
}
- (BubbleChartData *)generateBubbleData
{
    BubbleChartData *bd = [[BubbleChartData alloc] init];
   
    NSMutableArray *entries = [[NSMutableArray alloc] init];
     NSMutableArray * yVals2 = [[NSMutableArray alloc] init];
    for (int index = 0; index < 10; index++)
    {
        double y = arc4random_uniform(105) +1.0;
        double size = arc4random_uniform(30) + 1.0;
        [entries addObject:[[BubbleChartDataEntry alloc] initWithX:index + 0.5 y:y size:1]];
        double y1 = arc4random_uniform(95) +1.0;
        double size1 = arc4random_uniform(30) + 1.0;
          [yVals2 addObject:[[BubbleChartDataEntry alloc] initWithX:index y:y1 size:1 icon: [UIImage imageNamed:@"icon"]]];
    }
    
//    bubbleDate.setBubbleScale(float bubbleScale);//设置气泡的比例大小
//    bubbleDate.setHasLabelsOnlyForSelected(boolean hasLabelsOnlyForSelected);//设置文本只有当点击时显示
//    bubbleDate.setMinBubbleRadius(int minBubbleRadius);//设置气泡的最小半径
    
   
    [bd addDataSet:[self getArr:entries BubbleChartDataSet:[UIColor redColor]]];
    [bd addDataSet:[self getArr:yVals2 BubbleChartDataSet:[UIColor greenColor]]];
    return bd;
}
-(BubbleChartDataSet *)getArr:(NSMutableArray *)entries BubbleChartDataSet:(UIColor * )color{
     BubbleChartDataSet *set = [[BubbleChartDataSet alloc] initWithEntries:entries label:@"Bubble DataSet"];
         set.drawIconsEnabled = NO;
        set.highlightCircleWidth = 2;
        set.highlightEnabled = NO;
        set.highlightLineWidth = 1;
    //    [set setColors:ChartColorTemplates.vordiplom];
        [set setColor:color];
        set.valueTextColor = UIColor.whiteColor;
        set.valueFont = [UIFont systemFontOfSize:10.f];
        [set setDrawValuesEnabled:NO];
    
    return set;
}
- (LineChartData *)generateLineData
{
    LineChartData *d = [[LineChartData alloc] init];
    
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 30; index++)
    {
        [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5 y:(arc4random_uniform(15) + 5)]];
    }
    
    LineChartDataSet *set = [[LineChartDataSet alloc] initWithEntries:entries label:@"Line DataSet"];
    [set setColor:[UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f]];
    set.lineWidth = 1;
    [set setCircleColor:[UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f]];
    set.circleRadius = 3.0;
    set.circleHoleRadius = 2.5;
    set.fillColor = [UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f];
    set.mode = LineChartModeCubicBezier;
    set.drawValuesEnabled = YES;
    set.drawCirclesEnabled = NO;
    set.drawCircleHoleEnabled = NO;
    set.highlightEnabled = NO;
       set.drawValuesEnabled = NO;       ;
    set.valueFont = [UIFont systemFontOfSize:10.f];
    set.valueTextColor = [UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f];
    
    set.axisDependency = AxisDependencyLeft;
    
    [d addDataSet:set];
    
    return d;
}
#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

#pragma mark - IAxisValueFormatter

- (NSString *)stringForValue:(double)value
                        axis:(ChartAxisBase *)axis
{
    return @"344";
}


@end
