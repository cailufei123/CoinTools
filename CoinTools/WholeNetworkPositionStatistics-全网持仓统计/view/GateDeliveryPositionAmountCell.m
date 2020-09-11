//
//  GateDeliveryPositionAmountCell.m
//  block-pro
//
//  Created by MAC on 2020/9/4.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateDeliveryPositionAmountCell.h"
#import "GatePublicSelectView.h"
#import <CoinTools/CoinTools-Swift.h>
@interface GateDeliveryPositionAmountCell ()<ChartViewDelegate, IChartAxisValueFormatter>
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;

@end
@implementation GateDeliveryPositionAmountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.describeLb.text = @"合约BTC 一张=100美元";
    self.describeLb.textColor = gateColor(@"9fafc4");
    self.describeLb.font = gateFont(12, Normal);
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
    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
 
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES  //网格线的颜色
    leftAxis.gridColor = gateColor(@"f6f6f9"); //网格线的颜色
    leftAxis.axisLineColor = gateColor(gateGridColor);
     leftAxis.labelTextColor = gateColor(axislabelTextColor);
    ChartXAxis *xAxis = _chartView.xAxis;
//    xAxis.labelPosition = XAxisLabelPositionBothSided;
    xAxis.axisMinimum = -0.5;
      xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    xAxis.valueFormatter = self;
  xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelRotationAngle = 0;
  xAxis.axisLineColor = gateColor(gateGridColor);
  xAxis.labelTextColor = gateColor(axislabelTextColor);
   
   XYMarkerView *marker = [[XYMarkerView alloc]
                                  initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
                                  font: [UIFont systemFontOfSize:12.0]
                                  textColor: UIColor.whiteColor
                                  insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)
                                  xAxisValueFormatter: _chartView.xAxis.valueFormatter];
    marker.chartView = self.chartView;
    marker.arrowSize =  CGSizeMake(8,8);
    marker.minimumSize = CGSizeMake(80.f, 40.f);
    self.chartView.marker = marker;
    
    
    
  NSMutableArray * arr = [NSMutableArray array];
        
        for (int i = 0; i<2; i++) {
            GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
            if (i == 0) {
                  selectModel.color = gateColor(@"5064f2");
                selectModel.titleText = @"hahah";
            }
            if (i == 1) {
                selectModel.color = gateColor(@"07c69d");
                selectModel.titleText = @"哈哈哈";
            }
            if (i == 2) {
                selectModel.color = UIColor.orangeColor;
               selectModel.titleText = @"吼吼吼";
            }
            [arr addObject:selectModel];
    }
    self.topPublicSelectView.arr = arr;
    [self.topSelectView addSubview:self.topPublicSelectView];
   

     [self setChartData];
  
}

-(GatePublicSelectView *)topPublicSelectView{
  if (!_topPublicSelectView) {
      _topPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht-60, 30)];
      _topPublicSelectView.centerX = scrWeiht/2;
      _topPublicSelectView.checkboxEnabled = YES;
       @weakify(self)
      _topPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
          @strongify(self)
                     LineChartDataSet * set =  (LineChartDataSet *) self.chartView.lineData.dataSets[index];
          set.visible = !publicSelectModel.selectEnabled;
                     [self.chartView setNeedsDisplay];
      };
      
   }
  return _topPublicSelectView;
}




- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
    
    data.lineData = [self generateLineData];
    data.barData = [self generateBarData];
//    data.bubbleData = [self generateBubbleData];
//    data.scatterData = [self generateScatterData];
//    data.candleData = [self generateCandleData];
    
//    _chartView.xAxis.axisMaximum = data.xMax + 0.25;

    _chartView.data = data;
}
- (BarChartData *)generateBarData
{
    NSMutableArray<BarChartDataEntry *> *entries1 = [[NSMutableArray alloc] init];
//    NSMutableArray<BarChartDataEntry *> *entries2 = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 30; index++)
    {
        [entries1 addObject:[[BarChartDataEntry alloc] initWithX:index y:(arc4random_uniform(250) + 25)]];
        
        // stacked
//        [entries2 addObject:[[BarChartDataEntry alloc] initWithX:0.0 y:arc4random_uniform(13) + 12]];
    }
    _chartView.xAxis.axisMaximum = 30+0.5;
    BarChartDataSet *set1 = [[BarChartDataSet alloc] initWithEntries:entries1 label:@"Bar 1"];
    [set1 setColor:gateColor(@"ffbc51")];
    set1.valueTextColor = [UIColor colorWithRed:60/255.f green:220/255.f blue:78/255.f alpha:1.f];
    set1.valueFont = [UIFont systemFontOfSize:10.f];
    set1.axisDependency = AxisDependencyRight;
     set1.highlightEnabled = NO;

    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
          [dataSets addObject:set1];
    BarChartData *d = [[BarChartData alloc] initWithDataSets:dataSets];
   [d setDrawValues:NO];
 
     [d setBarWidth:0.5];
    // make this BarData object grouped
//    [d groupBarsFromX:0.0 groupSpace:groupSpace barSpace:barSpace]; // start at x = 0
//    [d addDataSet:set1];
    return d;
}

- (LineChartData *)generateLineData
{
    LineChartData *d = [[LineChartData alloc] init];
    
   
    
  
    for (int index = 0; index <  self.topPublicSelectView.arr.count; index++){
        GatePublicSelectModel *  selectModel = self.topPublicSelectView.arr[index];
        
        
        NSMutableArray *entries = [[NSMutableArray alloc] init];
          
           for (int index = 0; index < 30; index++)
           {
               [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5 y:(arc4random_uniform(15) + 5)]];
             
           }
        
        
        [d addDataSet:[self getArr:entries lineChartDataSet:selectModel.color]];
    }
   
    
    return d;
}
-(LineChartDataSet *)getArr:(NSMutableArray *)entries lineChartDataSet:(UIColor * )color{
    LineChartDataSet *set = [[LineChartDataSet alloc] initWithEntries:entries label:@"Line DataSet"];
        [set setColor:color];
        set.lineWidth = 1;
//        [set setCircleColor:gateColor(@"ffbc51")];
        set.circleRadius = 3.0;
        set.circleHoleRadius = 2.5;
//        set.fillColor = [UIColor redColor];
        set.mode = LineChartModeCubicBezier;
        set.drawValuesEnabled = YES;
        set.drawCirclesEnabled = NO;
        set.drawCircleHoleEnabled = NO;
        set.highlightEnabled = NO;
        set.drawValuesEnabled = NO;
        set.highlightEnabled = YES;
        set.highlightColor = [UIColor.grayColor colorWithAlphaComponent:0.5];
        set.highlightLineWidth = 10;
        set.drawHorizontalHighlightIndicatorEnabled = NO;
        set.valueFont = [UIFont systemFontOfSize:10.f];
        set.valueTextColor = [UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f];
        
        set.axisDependency = AxisDependencyLeft;

    return set;
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


