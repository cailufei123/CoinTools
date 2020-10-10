//
//  GTDuoKongLineChartsTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTDuoKongLineChartsTableViewCell.h"
#import <CoinTools/CoinTools-Swift.h>
#import "GTYxisFearIndexValueFormatter.h"
#import "GTXAxisFearIndexValueFormatter.h"

@import Charts;
@interface GTDuoKongLineChartsTableViewCell() <ChartViewDelegate, IChartAxisValueFormatter>
@property (weak, nonatomic) IBOutlet CombinedChartView *chartView;
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;
@property(nonatomic,strong) GTXAxisFearIndexValueFormatter * xXisFearIndexValueFormatter;
@property(nonatomic,strong) GTYxisFearIndexValueFormatter * yXisFearIndexValueFormatter;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@end
@implementation GTDuoKongLineChartsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_chartView setExtraOffsetsWithLeft:0 top:0 right:0 bottom:0];
   
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

    
    
    
    self.yXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
    self.yXisFearIndexValueFormatter.formatterType = GTFormatterYRightDuoKong;
    rightAxis.valueFormatter = self.yXisFearIndexValueFormatter;
    rightAxis.drawGridLinesEnabled = YES;
    rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES  //网格线的颜色
    rightAxis.gridColor = gateColor(@"f6f6f9"); //网格线的颜色
    rightAxis.axisLineColor = gateColor(gateGridColor);
     rightAxis.labelTextColor = gateColor(axislabelTextColor);
//    rightAxis.valueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
    ChartYAxis *leftAxis = _chartView.leftAxis;
//    self.yXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
//    self.yXisFearIndexValueFormatter.formatterType = GTFormatterYDuoKong;
//    leftAxis.valueFormatter = self.yXisFearIndexValueFormatter;
//    leftAxis.drawGridLinesEnabled = YES;
//    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES  //网格线的颜色
//    leftAxis.gridColor = gateColor(@"f6f6f9"); //网格线的颜色
//    leftAxis.axisLineColor = gateColor(gateGridColor);
//     leftAxis.labelTextColor = gateColor(axislabelTextColor);
    leftAxis.drawGridLinesEnabled = NO;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    leftAxis.axisLineColor = gateColor(gateGridColor);
        leftAxis.labelTextColor = gateColor(axislabelTextColor);
  GTYxisFearIndexValueFormatter *  yXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
       yXisFearIndexValueFormatter.formatterType = GTFormatterYLeftAxisDuoKong;
       leftAxis.valueFormatter = yXisFearIndexValueFormatter;
    ChartXAxis *xAxis = _chartView.xAxis;
  
//    xAxis.labelPosition = XAxisLabelPositionBothSided;
    xAxis.axisMinimum = -0.5;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    self.xXisFearIndexValueFormatter = [GTXAxisFearIndexValueFormatter getGTXAxisFearIndexValueFormatter];
    self.xXisFearIndexValueFormatter.formatterType = GTFormatterXDuoKong;
    xAxis.valueFormatter = self.xXisFearIndexValueFormatter;
    
    xAxis.labelPosition  = XAxisLabelPositionBottom;
    xAxis.labelCount = 4;
  

//     xAxis.centerAxisLabelsEnabled = YES;
    //    xAxis.labelRotationAngle = 50;
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
      [self.chartView animateWithXAxisDuration:2.0f];
    
    

    [self.selectView addSubview:self.topPublicSelectView];
   
 
   
  
}
//-(void)setFearIndexModel:(GTFearIndexModel *)fearIndexModel{
//    _fearIndexModel = fearIndexModel;
//
////    self.xXisFearIndexValueFormatter.publicArry = fearIndexModel.bcoin_btc_vix_data_info;
////
////    [self addFearIndexModel];
////
////      [self setChartData];
//
//}

-(void)setBcoin_coin_long_short_infos:(NSArray *)bcoin_coin_long_short_infos{
    _bcoin_coin_long_short_infos = bcoin_coin_long_short_infos;
//      self.yXisFearIndexValueFormatter.publicArry = bcoin_coin_long_short_infos;
     self.xXisFearIndexValueFormatter.publicArry = bcoin_coin_long_short_infos;
    [self addFearIndexModel];
      
        [self setChartData];
}


-(void)addFearIndexModel{
  NSMutableArray * arr = [NSMutableArray array];
         GatePublicSelectModel * selectModel = [[GatePublicSelectModel alloc] init];
         selectModel.color = gateColor(@"8734d9");
         selectModel.titleText = @"开多比例";
         GatePublicSelectModel * selectModel1 = [[GatePublicSelectModel alloc] init];
            selectModel1.color = gateColor(@"5a7dee");
             selectModel1.titleText = @"BTC报价";
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
           self.chartView.leftAxis.enabled = YES;
            self.chartView.rightAxis.enabled = YES;
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
        
//          [self generateLineData];
           [self.chartView.data notifyDataChanged];
           [self.chartView notifyDataSetChanged];
           [self.chartView setNeedsDisplay];
          [self.chartView animateWithXAxisDuration:2];
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
   
    
   
    for (int index = 0; index <  self.bcoin_coin_long_short_infos.count; index++){
         
        bcoin_coin_long_short_infoModel * bcoin_btc_vix_data_infoModel =  self.bcoin_coin_long_short_infos[index];
      
          [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5  y:[bcoin_btc_vix_data_infoModel.offer doubleValue]]];
 [entries1 addObject:[[ChartDataEntry alloc] initWithX:index + 0.5  y:[bcoin_btc_vix_data_infoModel.long_rate doubleValue]]];
        
      

    }
    LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(@"8734d9")];
    set1.axisDependency = AxisDependencyRight;
  
    LineChartDataSet * set2 = [self getArr:entries1 lineChartDataSet:gateColor(@"5a7dee")];
        set2.axisDependency = AxisDependencyLeft;
     [d addDataSet:set1];
      [d addDataSet:set2];

     
          
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
      // 第一种填充样式:单色填充
                      set.drawFilledEnabled = YES;                                           // 是否填充颜色，默认 NO
//                      set.fillColor = [UIColor redColor];                                    // 填充颜色
                      set.fillAlpha = 0.5;
    NSArray *gradientColors = @[
        (id)[ChartColorTemplates colorFromString:@"#ffffff"].CGColor,
                                    (id)[UIColor redColor].CGColor,
                                     
                                     ];
         CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
         
//         set.fillAlpha = 1.f;
         set.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
         set.drawFilledEnabled = NO;// 填充颜色的透明度
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




