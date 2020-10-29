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
@property(nonatomic,strong)GTChartPMarkerView * marker;
@property(nonatomic,strong) GTXAxisFearIndexValueFormatter * xXisFearIndexValueFormatter;
@property(nonatomic,strong)  GTYxisFearIndexValueFormatter *  yLeftXisFearIndexValueFormatter;
@property(nonatomic,strong) GTYxisFearIndexValueFormatter * yXisFearIndexValueFormatter;
@property(nonatomic,strong)NSMutableArray * temps;
@property(nonatomic,strong)NSMutableArray * styleArr;
@property(nonatomic,strong)NSMutableArray * allstyleArr;
@property (weak, nonatomic) IBOutlet GTSwitchBt *switchBt;
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

  _chartView.rightAxis.enabled = YES;
    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    self.yXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
    self.yXisFearIndexValueFormatter.formatterType = GTFormatterYRightChiCang;
    rightAxis.valueFormatter = self.yXisFearIndexValueFormatter ;
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES  //网格线的颜色
    leftAxis.gridColor = gateColor(@"f6f6f9"); //网格线的颜色
    leftAxis.axisLineColor = gateColor(gateGridColor);
     leftAxis.labelTextColor = gateColor(axislabelTextColor);
    self.yLeftXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
  
       leftAxis.valueFormatter = self.yLeftXisFearIndexValueFormatter ;
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.axisMinimum = -0.5;
      xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    
    
   self.xXisFearIndexValueFormatter = [GTXAxisFearIndexValueFormatter getGTXAxisFearIndexValueFormatter];
    xAxis.valueFormatter = self.xXisFearIndexValueFormatter;;
    
    
  xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelRotationAngle = 0;
  xAxis.axisLineColor = gateColor(gateGridColor);
  xAxis.labelTextColor = gateColor(axislabelTextColor);
   
    xAxis.labelCount = 3;
   
    
    GTChartPMarkerView * marker = [GTStyleManager getChartPMarkerViewWhit];
    marker.chartView =  self.chartView;
    marker.aleartType = GTChartPMarkerViewCalendarPermissionChiCang;
    self.marker = marker;
    self.chartView.marker = marker;
    [self.topSelectView addSubview:self.topPublicSelectView];
    marker.xAxisValueFormatter = self.xXisFearIndexValueFormatter;
    @weakify(self)
    self.switchBt.selectBlock = ^(BOOL select) {
        @strongify(self)
      
        self.holdData.isSelected = select;
        
        [self setChartData];
        
        self.holdData = self.holdData;
        
    };
}

-(GatePublicSelectView *)topPublicSelectView{
  if (!_topPublicSelectView) {
      _topPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht-60, 30)];
      _topPublicSelectView.centerX = scrWeiht/2;
      _topPublicSelectView.checkboxEnabled = YES;
       @weakify(self)
      _topPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
          @strongify(self)
                NSMutableArray * styleArr1 = [NSMutableArray array];
          if (!self.holdData.isSelected) {
              BarChartDataSet * set =  (BarChartDataSet *) self.chartView.barData.dataSets[index+1];
              set.visible = !publicSelectModel.selectEnabled;
            
              for (int i = 0; i<self.chartView.barData.dataSets.count; i++) {
                  BarChartDataSet * set1 = (BarChartDataSet *) self.chartView.barData.dataSets[i];
                  if (set1.isVisible) {
                      [styleArr1 addObject:self.allstyleArr[i]];
                  }
                  
              }
          }else{
              LineChartDataSet * set =  (LineChartDataSet *) self.chartView.lineData.dataSets[index+1];
              set.visible = !publicSelectModel.selectEnabled;
//              NSMutableArray * styleArr1 = [NSMutableArray array];
              for (int i = 0; i<self.chartView.lineData.dataSets.count; i++) {
                  LineChartDataSet * set1 = (LineChartDataSet *) self.chartView.lineData.dataSets[i];
                  if (set1.isVisible) {
                      [styleArr1 addObject:self.allstyleArr[i]];
                  }
                  
              }
          }
         
          
          
          
          self.marker.stylemodels = styleArr1;
          [self.chartView setNeedsDisplay];
      };
      
   }
  return _topPublicSelectView;
}

-(void)setHoldData:(GTPublicContentModel *)holdData{
    _holdData = holdData;
    NSMutableArray * arr = [NSMutableArray array];
    self.temps =  [NSMutableArray array];
    
//    NSMutableArray * styleArr = [NSMutableArray array];
//    self.styleArr = styleArr;
          for (int i = 1; i<holdData.alldatalist.count; i++) {
              GTHomeTitleModel * title = holdData.alldatalist[i].title;
              GTHomeTitleModel * titleModel = [GTDataManager getItemModelWhit:holdData.alldatalist[i].datalist.firstObject].firstObject;
              GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
              selectModel.color = gateColor(titleModel.color);
              selectModel.titleText = title.content;
              if (i>1) {
                  [arr addObject:selectModel];
              }
              [self.temps addObject:selectModel];
//              [styleArr addObject:@{@"title":[NSString stringWithFormat:@"%@:%@", title.content,titleModel.content] ,@"color":gateColor(titleModel.color)}];
  
      }
    
    self.xXisFearIndexValueFormatter.publicArry = [GTDataManager getItemModelWhit:holdData.alldatalist.firstObject.datalist.firstObject];
//    self.marker.stylemodels = styleArr;
    
    self.topPublicSelectView.arr = arr;
    [self setChartData];
}


- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
//
//    data.lineData = [self generateLineData];
//    CombinedChartData *data = [[CombinedChartData alloc] init];
  
    if (!_holdData.isSelected) {
        data.barData = [self generateBarData];
    }else{
        data.lineData = [self generateLineData];
    }

    _chartView.xAxis.axisMinimum = data.xMin + 0.25;
    _chartView.xAxis.axisMaximum = data.xMax + 0.5;
    _chartView.data = data;
   [_chartView.data notifyDataChanged];

    _chartView.data = data;
}
- (BarChartData *)generateBarData
{
//    NSMutableArray<BarChartDataEntry *> *entries1 = [[NSMutableArray alloc] init];
////    NSMutableArray<BarChartDataEntry *> *entries2 = [[NSMutableArray alloc] init];
//
//    for (int index = 0; index < 30; index++)
//    {
//        [entries1 addObject:[[BarChartDataEntry alloc] initWithX:index y:(arc4random_uniform(250) + 25)]];
//
//        // stacked
////        [entries2 addObject:[[BarChartDataEntry alloc] initWithX:0.0 y:arc4random_uniform(13) + 12]];
//    }
//    _chartView.xAxis.axisMaximum = 30+0.5;
//    BarChartDataSet *set1 = [[BarChartDataSet alloc] initWithEntries:entries1 label:@"Bar 1"];
//    [set1 setColor:gateColor(@"ffbc51")];
//    set1.valueTextColor = [UIColor colorWithRed:60/255.f green:220/255.f blue:78/255.f alpha:1.f];
//    set1.valueFont = [UIFont systemFontOfSize:10.f];
//    set1.axisDependency = AxisDependencyRight;
//     set1.highlightEnabled = NO;
//
//    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
//          [dataSets addObject:set1];
//    BarChartData *d = [[BarChartData alloc] initWithDataSets:dataSets];
//   [d setDrawValues:NO];
//
//     [d setBarWidth:0.5];
//
//    return d;
//
    
    
    
    
    
    BarChartData *d = [[BarChartData alloc] init];
         [d setBarWidth:0.5];
          double leftAxisMin = MAXFLOAT;
          double leftAxisMax = 0;
         double rightAxisMin = MAXFLOAT;
         double rightAxisMax = 0;
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    for (int i = 1; i<_holdData.alldatalist.count; i++) {
        
        
        
        
       NSArray< GTHomeTitleModel *> * models = [GTDataManager getItemModelWhit:_holdData.alldatalist[i].datalist.firstObject];
        NSMutableArray *entries = [[NSMutableArray alloc] init];
        NSLog(@"%@",models);
        for (int index = 0; index<models.count; index++) {
            GTHomeTitleModel * titleModel  = models[index];
           
            if (i == 1) {
                double val = [titleModel.content integerValue];
                rightAxisMax = MAX(val, rightAxisMax);
                rightAxisMin = MIN(val, rightAxisMin);
            }else{
                double val = [titleModel.content integerValue];
                leftAxisMax = MAX(val, leftAxisMax);
                leftAxisMin = MIN(val, leftAxisMin);
            }
            [entries addObject:[[BarChartDataEntry alloc] initWithX:index + 0.5 y:([titleModel.content doubleValue])]];
       }
       
        BarChartDataSet * set1 = [self getArr:entries barChartDataSet:gateColor(models.firstObject.color) drawFilledEnabled:i == 1?YES:NO];
        [dataSets addObject:set1];
        if (i == 1) {
            set1.axisDependency = AxisDependencyRight;
        }else{
            set1.axisDependency = AxisDependencyLeft;
        }
//        [d addDataSet:set1];
    }
//    [d groupBarsFromX: startYear groupSpace: groupSpace barSpace: barSpace];
    d.dataSets = dataSets;
    
    self.chartView.leftAxis.axisMinimum = leftAxisMin;
    self.chartView.leftAxis.axisMaximum = leftAxisMax;
    self.chartView.rightAxis.axisMinimum = rightAxisMin;
    self.chartView.rightAxis.axisMaximum = rightAxisMax;
    float groupSpace = 0.08f;
    float barSpace = 0.03f;
    [d groupBarsFromX: self.chartView.xAxis.axisMinimum  groupSpace: 1 barSpace: barSpace];
    return d;
}


-(BarChartDataSet *)getArr:(NSMutableArray *)entries barChartDataSet:(UIColor * )color drawFilledEnabled:(BOOL)drawFilledEnabled{
    BarChartDataSet *set =  [[BarChartDataSet alloc] initWithEntries:entries label:@"Company A"];
    set.drawValuesEnabled = NO;
    [set setColor:color];
    return set;
}



- (LineChartData *)generateLineData
{
    LineChartData *d = [[LineChartData alloc] init];

          double leftAxisMin = MAXFLOAT;
          double leftAxisMax = 0;
         double rightAxisMin = MAXFLOAT;
         double rightAxisMax = 0;
    for (int i = 1; i<_holdData.alldatalist.count; i++) {
       NSArray< GTHomeTitleModel *> * models = [GTDataManager getItemModelWhit:_holdData.alldatalist[i].datalist.firstObject];
        NSMutableArray *entries = [[NSMutableArray alloc] init];
        NSLog(@"%@",models);
        for (int index = 0; index<models.count; index++) {
            GTHomeTitleModel * titleModel  = models[index];
           
            if (i == 1) {
                double val = [titleModel.content integerValue];
                rightAxisMax = MAX(val, rightAxisMax);
                rightAxisMin = MIN(val, rightAxisMin);
            }else{
                double val = [titleModel.content integerValue];
                leftAxisMax = MAX(val, leftAxisMax);
                leftAxisMin = MIN(val, leftAxisMin);
            }
            [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5 y:([titleModel.content doubleValue])]];
       }
       
        LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(models.firstObject.color) drawFilledEnabled:i == 1?YES:NO];
      
        if (i == 1) {
            set1.axisDependency = AxisDependencyRight;
        }else{
            set1.axisDependency = AxisDependencyLeft;
        }
        [d addDataSet:set1];
    }
  
    self.chartView.leftAxis.axisMinimum = leftAxisMin;
    self.chartView.leftAxis.axisMaximum = leftAxisMax;
    self.chartView.rightAxis.axisMinimum = rightAxisMin;
    self.chartView.rightAxis.axisMaximum = rightAxisMax;
    return d;
}
-(LineChartDataSet *)getArr:(NSMutableArray *)entries lineChartDataSet:(UIColor * )color drawFilledEnabled:(BOOL)drawFilledEnabled{
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
       NSArray *gradientColors = @[
        (id)[ChartColorTemplates colorFromString:@"#ffffff"].CGColor,
                                    (id)color.CGColor,
                                     
                                     ];
         CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
         
//         set.fillAlpha = 1.f;
         set.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
         set.drawFilledEnabled = drawFilledEnabled;// 填充颜色的透明度
//        set.axisDependency = AxisDependencyLeft;

    return set;
}
#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * _Nonnull)chartView
                     entry:(ChartDataEntry * _Nonnull)entry
                 highlight:(ChartHighlight * _Nonnull)highlight {

    NSArray * lineChartDataSets = self.chartView.lineData.dataSets;
    for (LineChartDataSet *set in lineChartDataSets) {
        
        for ( ChartDataEntry *entry in set.entries) { entry.icon = nil; }
     
    }
    
    NSInteger  x = entry.x;
    
   
    for (int i =0; i<lineChartDataSets.count; i++) {
        
        LineChartDataSet *set = lineChartDataSets[i];
       
        ChartDataEntry *entry = set.entries[ x ];
        GatePublicSelectModel *  selectModel =  self.temps[i];

        entry.icon = [GTStyleManager  selecrDotStyle:selectModel.color];
    }
    
    
    [self setLineDot: x];
    
    
    
    
}

-(void)setLineDot:(NSInteger )index{
   
     NSMutableArray * styleArr = [NSMutableArray array];
     self.allstyleArr = [NSMutableArray array];
    
    self.styleArr = styleArr;
     for (int i = 0; i<self.chartView.data.dataSets.count; i++) {
         
         ChartDataSet * set1 = (ChartDataSet *) self.chartView.data.dataSets[i];
                GTHomeTitleModel * title = self.holdData.alldatalist[i+1].title;
                GTHomeTitleModel * titleModel = [GTDataManager getItemModelWhit:self.holdData.alldatalist[i+1].datalist.firstObject][index];
                GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
                selectModel.color = gateColor(titleModel.color);
                selectModel.titleText = title.content;
                if (set1.isVisible) {
                    [styleArr addObject:@{@"title":[NSString stringWithFormat:@"%@:%@", title.content,titleModel.content] ,@"color":gateColor(titleModel.color)}];
              }
          [self.allstyleArr addObject:@{@"title":[NSString stringWithFormat:@"%@:%@", title.content,titleModel.content] ,@"color":gateColor(titleModel.color)}];
    
        }
    
     self.marker.stylemodels = styleArr;
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

