//
//  GTFearIndexLineChartsTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTFearIndexLineChartsTableViewCell.h"
#import <CoinTools/CoinTools-Swift.h>
#import "GTYxisFearIndexValueFormatter.h"
#import "GTXAxisFearIndexValueFormatter.h"

@import Charts;
@interface GTFearIndexLineChartsTableViewCell() <ChartViewDelegate, IChartAxisValueFormatter>
@property (weak, nonatomic) IBOutlet CombinedChartView *chartView;
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;
@property(nonatomic,strong) GTXAxisFearIndexValueFormatter * xXisFearIndexValueFormatter;
@property(nonatomic,strong) GTYxisFearIndexValueFormatter * yXisFearIndexValueFormatter;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@end
@implementation GTFearIndexLineChartsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_chartView setExtraOffsetsWithLeft:20 top:0 right:0 bottom:0];
   
   _chartView.delegate = self;

 _chartView.legend.formToTextSpace = 50;
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

//  _chartView.rightAxis.enabled = NO;
    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    rightAxis.axisLineColor = gateColor(gateGridColor);
        rightAxis.labelTextColor = gateColor(axislabelTextColor);
    self.yXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
     rightAxis.valueFormatter = self.yXisFearIndexValueFormatter;
//    rightAxis.valueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
    ChartYAxis *leftAxis = _chartView.leftAxis;
    
    
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES  //网格线的颜色
    leftAxis.gridColor = gateColor(@"f6f6f9"); //网格线的颜色
    leftAxis.axisLineColor = gateColor(gateGridColor);
     leftAxis.labelTextColor = gateColor(axislabelTextColor);
    ChartXAxis *xAxis = _chartView.xAxis;
  
//    xAxis.labelPosition = XAxisLabelPositionBothSided;
    xAxis.axisMinimum = -0.5;
//     xAxis.axisMaxLabels = 4;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    self.xXisFearIndexValueFormatter = [GTXAxisFearIndexValueFormatter getGTXAxisFearIndexValueFormatter];
  
    xAxis.valueFormatter = self.xXisFearIndexValueFormatter;
    xAxis.labelPosition  = XAxisLabelPositionBottom;
    xAxis.labelCount = 3;
  

//     xAxis.centerAxisLabelsEnabled = YES;
    //    xAxis.labelRotationAngle = 50;
    xAxis.axisLineColor = gateColor(gateGridColor);
    xAxis.labelTextColor = gateColor(axislabelTextColor);
   
    GTChartPMarkerView * marker1 = [GTChartPMarkerView loadFromNib:@"GTChartPMarkerView"];
//     self.marker1 = marker1;
    
    
   @weakify(self)
     marker1.aleartType = GTChartPMarkerViewCalendarPermissionKongHuang;
     marker1.cycleSelectBlock = ^NSArray * _Nonnull(NSInteger index) {
          @strongify(self)
         NSMutableArray * arr = [NSMutableArray array];
         
         GTBcoin_btc_vix_data_infoModel * bcoin_btc_vix_data_infoModel = self.fearIndexModel.bcoin_btc_vix_data_info[index];

          
        
       
         [arr addObject:@{@"title":bcoin_btc_vix_data_infoModel.offer,@"color":gateColor(@"44775a")}];
         [arr addObject:@{@"title":bcoin_btc_vix_data_infoModel.vix_value,@"color":gateColor(@"5b95f1")}];
           return arr;
       };
     [marker1 layercornerRadius:5];
     marker1.alpha = 0.8;
     marker1.backgroundColor = [UIColor blackColor];
     marker1.chartView =  self.chartView;
      marker1.offset = CGPointMake(10, 0);
       self.chartView.marker = marker1;
    marker1.aleartType = GTChartPMarkerViewCalendarPermissionKongHuang;
     marker1.xAxisValueFormatter = self.xXisFearIndexValueFormatter;


    

    [self.selectView addSubview:self.topPublicSelectView];
   
 
   
  
}
-(void)setFearIndexModel:(GTFearIndexModel *)fearIndexModel{
    _fearIndexModel = fearIndexModel;
  
    self.xXisFearIndexValueFormatter.publicArry = fearIndexModel.bcoin_btc_vix_data_info;
    
    [self addFearIndexModel];
    
      [self setChartData];
//    [self.chartView.data notifyDataChanged];
//              [self.chartView notifyDataSetChanged];
//             [self.chartView animateWithXAxisDuration:2];
}
-(void)addFearIndexModel{
      NSMutableArray * arr = [NSMutableArray array];
    GatePublicSelectModel * selectModel = [[GatePublicSelectModel alloc] init];
    selectModel.color = gateColor(@"5b95f1");
    selectModel.titleText = @"贪梦恐慌指数";
    GatePublicSelectModel * selectModel1 = [[GatePublicSelectModel alloc] init];
       selectModel1.color = gateColor(@"44775a");
        selectModel1.titleText = @"BTC价格";
      [arr addObject:selectModel];
     [arr addObject:selectModel1];
      self.topPublicSelectView.arr = arr;
}

-(GatePublicSelectView *)topPublicSelectView{
  if (!_topPublicSelectView) {
      _topPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht-60, 50)];
      _topPublicSelectView.centerX = scrWeiht/2;
      _topPublicSelectView.checkboxEnabled = YES;
       @weakify(self)
      _topPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
          @strongify(self)
  LineChartDataSet * set =  (LineChartDataSet *) self.chartView.lineData.dataSets[index];
                               set.visible = !publicSelectModel.selectEnabled;
                               GatePublicSelectModel * publicSelectModel1 = self.topPublicSelectView.arr.firstObject;
                             GatePublicSelectModel * publicSelectModel2 = self.topPublicSelectView.arr.lastObject;
                               if (!publicSelectModel1.selectEnabled) {
                                    self.chartView.leftAxis.enabled = YES;
                               }else{
                                     self.chartView.leftAxis.enabled = NO;
                               }
                               if (!publicSelectModel2.selectEnabled) {
                                    self.chartView.rightAxis.enabled = YES;
                               }else{
                                     self.chartView.rightAxis.enabled = NO;
                               }
                             

          [self.chartView animateWithXAxisDuration:1];
      };
      
   }
  return _topPublicSelectView;
}




- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
   
    data.lineData = [self generateLineData];
    _chartView.data = data;
}


- (LineChartData *)generateLineData
{
    LineChartData *d = [[LineChartData alloc] init];

     NSMutableArray *entries = [[NSMutableArray alloc] init];
      NSMutableArray *entries1 = [[NSMutableArray alloc] init];
    for (int index = 0; index <  self.fearIndexModel.bcoin_btc_vix_data_info.count; index++){
         
        GTBcoin_btc_vix_data_infoModel * bcoin_btc_vix_data_infoModel = self.fearIndexModel.bcoin_btc_vix_data_info[index];

        [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5  y:[bcoin_btc_vix_data_infoModel.offer doubleValue]]];
        
        [entries1 addObject:[[ChartDataEntry alloc] initWithX:index + 0.5  y:[bcoin_btc_vix_data_infoModel.vix_value doubleValue]]];

    }
    LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(@"44775a")];
     set1.axisDependency = AxisDependencyRight;
  
    LineChartDataSet * set2 = [self getArr:entries1 lineChartDataSet:gateColor(@"5b95f1")];
        set2.axisDependency = AxisDependencyLeft;
      [d addDataSet:set1];
      [d addDataSet:set2];
       set1.drawFilledEnabled = YES;// 填充颜色的透明度
//     set1.lineWidth = 0;
     set2.drawFilledEnabled = NO;// 填充颜色的透明度
     
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
        set.highlightLineWidth = 5;
        set.drawHorizontalHighlightIndicatorEnabled = NO;
        set.valueFont = [UIFont systemFontOfSize:10.f];
        set.valueTextColor = [UIColor colorWithRed:240/255.f green:238/255.f blue:70/255.f alpha:1.f];
      // 第一种填充样式:单色填充
                      set.drawFilledEnabled = YES;                                           // 是否填充颜色，默认 NO
//                      set.fillColor = [UIColor redColor];                                    // 填充颜色
                      set.fillAlpha = 0.5;
    NSArray *gradientColors = @[
        (id)[ChartColorTemplates colorFromString:@"#ffffff"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#44775a"].CGColor,
                                     
                                     ];
         CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
         
//         set.fillAlpha = 1.f;
         set.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
         set.drawFilledEnabled = NO;// 填充颜色的透明度
//        set.axisDependency = AxisDependencyLeft;

    return set;
}
#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
    NSLog(@"%@",[self.xXisFearIndexValueFormatter stringForValue:entry.x axis:chartView.xAxis])   ;
    
    NSLog(@"%@",[self.yXisFearIndexValueFormatter stringForValue:entry.y axis:self.chartView.leftAxis])   ;
    ;
//      setLabel("x: " + xAxisValueFormatter!.stringForValue(entry.x, axis: YAxis()) + ", y: " + yFormatter.string(from: NSNumber(floatLiteral: entry.y))!)
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




