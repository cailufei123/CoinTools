//
//  GateThirtyDaysBurstStatisticsTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateThirtyDaysBurstStatisticsTableViewCell.h"
#import "GateXHorstAxisValueFormatter.h"
#import "GateYHorstAxisValueFormatter.h"
#import <CoinTools/CoinTools-Swift.h>
@interface GateThirtyDaysBurstStatisticsTableViewCell()
@property(nonatomic,strong)GateXHorstAxisValueFormatter * xAxisValueFormatter ;
@property(nonatomic,strong)GateYHorstAxisValueFormatter * yAxisValueFormatter ;
@property(nonatomic,strong) GatePublicSelectView * bottomPublicSelectView;
@property(nonatomic,strong) GTChartPMarkerView * marker1;
@property(nonatomic,strong) NSMutableArray * arrds;

@property (weak, nonatomic) IBOutlet GTSwitchBt *switchBt;
@end
@implementation GateThirtyDaysBurstStatisticsTableViewCell


- (IBAction)screenAcrion:(UIButton *)sender {
    
    !_selectBlock?:_selectBlock();
    
}

-(GateXHorstAxisValueFormatter *)xAxisValueFormatter{
    if (!_xAxisValueFormatter) {
        _xAxisValueFormatter = [GateXHorstAxisValueFormatter getGateXHorstAxisValueFormatter];
    }
    return _xAxisValueFormatter;
}
-(GateYHorstAxisValueFormatter *)yAxisValueFormatter{
    if (!_yAxisValueFormatter) {
        _yAxisValueFormatter = [GateYHorstAxisValueFormatter getGateYHorstAxisValueFormatter];
    }
    return _yAxisValueFormatter;
}
+(instancetype)loadThirtyDaysBurstStatisticsTableViewCell{
    return  loadXib
}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setChartView];
    self.arrds = [NSMutableArray array];
}

-(void)setChartView{
    @weakify(self)
    self.switchBt.selectBlock = ^(BOOL select) {
        @strongify(self)
        self.burstcalpic.isSelected = select;
        [self setChartData];
    };
    //设置偏移
    [self.chartView setExtraOffsetsWithLeft:0 top:0 right:0 bottom:0];
   
    _chartView.highlightPerTapEnabled = YES;
    _chartView.delegate = self;

    _chartView.chartDescription.enabled = NO;
    
    //当图表完全缩小的时候，每一次拖动都会高亮显示在图标视图上。默认YES
        self.chartView.highlightPerDragEnabled = YES;
        //设置最大高亮距离（dp）。在图表中的点击位置距离条目的距离超过此距离不会触发高亮显示。默认500
        self.chartView.maxHighlightDistance = 50;
        //设置为NO，禁止点击手势高亮显示值，值仍然可以通过拖动或编程方式突出显示。默认YES
        self.chartView.highlightPerTapEnabled = YES;
    
//    _chartView.xAxis.axisMinimum = 5;
//    _chartView.xAxis.axisMaximum =10;
    _chartView.maxVisibleCount = 40;
    _chartView.pinchZoomEnabled = NO;

    _chartView.drawGridBackgroundEnabled = NO;
    _chartView.drawBarShadowEnabled = NO;
    _chartView.drawValueAboveBarEnabled = NO;
    _chartView.highlightFullBarEnabled = YES;
    _chartView.doubleTapToZoomEnabled = NO;//关闭缩放
//    [_chartView setScaleMinima:2 scaleY:1];//关闭缩放
    [_chartView animateWithYAxisDuration:1.0f];
      [_chartView animateWithXAxisDuration:1.0f];
//    _chartView. highlightFullBarEnabled

//    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
//    leftAxisFormatter.maximumFractionDigits = 1;
//    leftAxisFormatter.negativeSuffix = @" $";
//    leftAxisFormatter.positiveSuffix = @" $";
    //柱状条后面画一个灰色区域，表示最大值。默认NO
    self.chartView.drawBarShadowEnabled = NO;
    //显示顶部文字。默认YES
    self.chartView.drawValueAboveBarEnabled = YES;
    //在圆柱左右两端各增加一半的条宽。默认NO
//   self.chartView.fitBars = YES;
     self.chartView.legend.enabled = NO;//是否显示图例
    //仅适用于堆叠式(stacked)，当为YES时，点击圆柱时即使只选中了一个堆栈条目，也会高亮整条圆柱。默认NO
//    self.chartView.highlightFullBarEnabled = YES;
//    self.chartView.maxHighlightDistance = 1000;
    self.chartView.scaleYEnabled = NO;                                      // 取消 Y 轴缩放
    self.chartView.dragXEnabled = YES;

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
    leftAxis.axisLineColor = [UIColor clearColor];
//    leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    leftAxis.valueFormatter = self.yAxisValueFormatter;
    _chartView.rightAxis.enabled = NO;
    leftAxis.labelTextColor = gateColor(axislabelTextColor);
    ChartXAxis *xAxis = _chartView.xAxis;
    // 开启抗锯齿

    xAxis.gridAntialiasEnabled = YES;
      xAxis.labelTextColor =  leftAxis.labelTextColor;
    xAxis.axisLineColor =  leftAxis.axisLineColor;
     xAxis.axisLineWidth =  0;
//    xAxis.axisMinimum = 2;
    xAxis.labelPosition = XAxisLabelPositionBottom;
   xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = self.xAxisValueFormatter;
    xAxis.labelCount = 3;
    xAxis.drawAxisLineEnabled = NO;
    ChartLegend *l = _chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    l.form = ChartLegendFormSquare;
    l.formSize = 10.0;
    l.formToTextSpace = 5.0;
    l.xEntrySpace = 6.0;
     l.stackSpace = 16.0;
   
    
    GTChartPMarkerView * marker1 = [GTChartPMarkerView loadFromNib:@"GTChartPMarkerView"];
    self.marker1 = marker1;
 
    marker1.aleartType = GTChartPMarkerViewCalendarPermissionBaoCang;
    marker1.cycleSelectBlock = ^NSArray * _Nonnull(NSInteger index) {
         @strongify(self)
        NSMutableArray * arr = [NSMutableArray array];
        
         GatePublicSelectModel * model1  =  self.bottomPublicSelectView.arr.firstObject;
         GatePublicSelectModel * model2  =  self.bottomPublicSelectView.arr.lastObject;
        if (!model1.selectEnabled) {
            [arr addObject:@{@"title":[NSString stringWithFormat:@"%@:%@", self.burstcalpic.alldatalist[1].title.content,[GTDataManager getItemModelWhit:self.burstcalpic.alldatalist[1].datalist.firstObject][index].content] ,@"color":gateColor([GTDataManager getItemModelWhit:self.burstcalpic.alldatalist[1].datalist.firstObject][index].color)}];
        }
    
        if (!model2.selectEnabled) {
            [arr addObject:@{@"title":[NSString stringWithFormat:@"%@:%@", self.burstcalpic.alldatalist[2].title.content,[GTDataManager getItemModelWhit:self.burstcalpic.alldatalist[2].datalist.firstObject][index].content],@"color":gateColor([GTDataManager getItemModelWhit:self.burstcalpic.alldatalist[2].datalist.firstObject][index].color)}];
        }
    
          return arr;
      };
 
    [marker1 layercornerRadius:5];
    marker1.alpha = 0.8;
    marker1.backgroundColor = [UIColor blackColor];
    marker1.chartView =  self.chartView;
     marker1.offset = CGPointMake(10, 0);
      self.chartView.marker = marker1;
    marker1.xAxisValueFormatter = self.xAxisValueFormatter;

  
    
    
    
   
         [self.bottomSelectView addSubview:self.bottomPublicSelectView];
         
}


-(GatePublicSelectView *)bottomPublicSelectView{
    if (!_bottomPublicSelectView) {
        _bottomPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, 220, 30)];
        _bottomPublicSelectView.centerX = scrWeiht/2;
        _bottomPublicSelectView.checkboxEnabled = YES;
        _bottomPublicSelectView.userInteractionEnabled = YES;
        @weakify(self)
        _bottomPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            
            @strongify(self)
            
            [self setChartData];
            [self.chartView animateWithYAxisDuration:1];
        };
        
     }
    return _bottomPublicSelectView;
}

-(void)setBurstcalpic:(GTPublicContentModel *)burstcalpic{
    _burstcalpic = burstcalpic;

    self.marker1.possArr = [GTDataManager getItemModelWhit:_burstcalpic.alldatalist[1].datalist.firstObject];
    if (self.arrds.count<=0) {
        for (int i = 1; i<burstcalpic.alldatalist.count; i++) {
            
            GTAlldatalistModel *alldatalistModel =burstcalpic.alldatalist[i];
            GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
            selectModel.color = gateColor([GTDataManager getItemModelWhit:_burstcalpic.alldatalist[i].datalist.firstObject].firstObject.color);
            
            selectModel.shape = square;
            selectModel.titleText =alldatalistModel.title.content;
            [self.arrds addObject:selectModel];
            
        }
    

    }


          self.bottomPublicSelectView.arr = self.arrds;
      self.bottomPublicSelectView.selectIndex = 0;
    self.xAxisValueFormatter.publicArr = [GTDataManager getItemModelWhit:_burstcalpic.alldatalist[0].datalist.firstObject];
      [self setChartData];
}
- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
  
    if (!self.burstcalpic.isSelected) {
        data.barData = [self generateBarData];
    }else{
        data.lineData = [self generateLineData];
    }

    _chartView.xAxis.axisMinimum = data.xMin + 0.25;
    _chartView.xAxis.axisMaximum = data.xMax + 0.25;
    _chartView.data = data;
   [_chartView.data notifyDataChanged];
   
    
}



- (LineChartData *)generateLineData
{
    LineChartData *d = [[LineChartData alloc] init];

          double leftAxisMin = MAXFLOAT;
          double leftAxisMax = 0;
     
  
    
    for (int i = 1; i<_burstcalpic.alldatalist.count; i++) {
        NSArray<GTHomeTitleModel *> * modelAr = [GTDataManager getItemModelWhit:_burstcalpic.alldatalist[i].datalist.firstObject];
        NSMutableArray *entries = [[NSMutableArray alloc] init];
        
        GatePublicSelectModel * model1  =  self.bottomPublicSelectView.arr[i-1];
        for (int index = 0; index<modelAr.count; index++) {
            GTHomeTitleModel * titleModel  = modelAr[index];
           
            double val = [titleModel.content doubleValue];
            leftAxisMax = MAX(val, leftAxisMax);
            leftAxisMin = MIN(val, leftAxisMin);
            
            [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5 y:(val)]];
       }
       
        if (!model1.selectEnabled) {
            LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(modelAr.firstObject.color) drawFilledEnabled:NO];
            set1.axisDependency = AxisDependencyLeft;
            
            [d addDataSet:set1];
        }
        
       
    }
  
//    self.chartView.leftAxis.axisMinimum = leftAxisMin;
//    self.chartView.leftAxis.axisMaximum = leftAxisMax;
   
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

- (BarChartData *)generateBarData{
   
    double leftAxisMin = MAXFLOAT;
    double leftAxisMax = 0;

    
    
    
    
    
    
    
    NSMutableArray *array = [NSMutableArray array];
 NSArray<GTHomeTitleModel *> * modelAr = [GTDataManager getItemModelWhit:_burstcalpic.alldatalist[1].datalist.firstObject];
 NSArray<GTHomeTitleModel *> * lastObjectmodelAr = [GTDataManager getItemModelWhit:_burstcalpic.alldatalist[2].datalist.firstObject];
    
   
    GatePublicSelectModel * model1  =  self.bottomPublicSelectView.arr.firstObject;
    GatePublicSelectModel * model2  =  self.bottomPublicSelectView.arr.lastObject;
//    self.chartView.xAxis.axisMaximum = modelAr.count - 1;
 for (int i = 0; i<modelAr.count; i++){
     GTHomeTitleModel *titleModel =modelAr[i];
     GTHomeTitleModel *titleModel1 =lastObjectmodelAr[i];
     double val = [titleModel.content doubleValue];
     leftAxisMax = MAX(val, leftAxisMax);
     leftAxisMin = MIN(val, leftAxisMin);
     NSMutableArray *  modelArr = [NSMutableArray array];
     if (!model1.selectEnabled) {
         [modelArr addObject:[NSNumber numberWithString:titleModel.content]];
     }
     if (!model2.selectEnabled) {
         [modelArr addObject:[NSNumber numberWithString:titleModel1.content]];
     }
     [array addObject:[[BarChartDataEntry alloc] initWithX:i+0.5 yValues:modelArr icon: [UIImage imageNamed:@"icon"]]];
    
}
    //set
    BarChartDataSet *set = [[BarChartDataSet alloc] initWithEntries:array label:@"Bar DataSet"];
   
 set.stackLabels = @[@"Births", @"Divorces"];

 if (modelAr.firstObject.color.length) {
     NSMutableArray *  modelColors = [NSMutableArray array];
     if (!model1.selectEnabled) {
         [modelColors addObject:gateColor(modelAr.firstObject.color)];
     }
     if (!model2.selectEnabled) {
         [modelColors addObject:gateColor(lastObjectmodelAr.firstObject.color)];
     }
     
     set.colors = modelColors.count>0?modelColors:@[UIColor.clearColor];
 }

     set.drawValuesEnabled = NO; //圆柱上是否显示文字
    BarChartData *data = [[BarChartData alloc] initWithDataSet:set];
      [data setBarWidth:0.5];
//    self.chartView.data = data;
    return  data;
}

    #pragma mark - ChartViewDelegate
    #pragma mark 图表中数值被选中
    -(void)chartValueSelected:(ChartViewBase *)chartView entry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight{
        if ([entry isKindOfClass:[BarChartDataEntry class]]) {
//          [GTDotManager chartDotManagerValueSelected]
        }else{
            [GTDotManager chartDotManagerValueSelected: self.chartView entry:entry highlight:highlight publicSelectModels:self.bottomPublicSelectView.arr];
        }
      
    }

    #pragma mark 图表中的空白区域被选中
    -(void)chartValueNothingSelected:(ChartViewBase *)chartView{
    //    NSLog(@"空白区域被选中");
    }

    #pragma mark 图表被缩放
    -(void)chartScaled:(ChartViewBase *)chartView scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY{
    //    NSLog(@"图表被缩放");
    }

    #pragma mark 图表被移动
    -(void)chartTranslated:(ChartViewBase *)chartView dX:(CGFloat)dX dY:(CGFloat)dY{
    //    NSLog(@"图表被移动");
    }



//- (IBAction)switchShapeAction:(UIButton*)sender {
////    CombinedChartData *data
//   
//   
//    
//  
//    
//  
////      LineChartDataSet *set1 = lineChartDataSets[index];
//     
////            set1.visible = !diffLineModel.selectEnabled;
////              [self.collectionView reloadData];
//    if (sender.isSelected) {
//        sender.selected = NO;
//        self.switchBt.backgroundColor = gateColor(@"5064f2");
//       
////        for (LineChartDataSet *set in self.chartView.lineData.dataSets) {set.visible = NO;}
////        for (LineChartDataSet *set in self.chartView.barData.dataSets) {set.visible = YES;}
//    }else{
//        sender.selected = YES;
////        f5faf9
//        self.switchBt.backgroundColor = gateColor(@"f6f9fb");
//      
////        for (LineChartDataSet *set in self.chartView.barData.dataSets) {set.visible = NO;}
////        for (LineChartDataSet *set in self.chartView.lineData.dataSets) {set.visible = YES;}
//    }
////    [self.chartView setNeedsDisplay];
//    [self setChartData];
//}

@end
