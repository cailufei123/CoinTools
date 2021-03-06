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
@end
@implementation GateThirtyDaysBurstStatisticsTableViewCell


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

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setChartView];
}

-(void)setChartView{
    //设置偏移
    [self.chartView setExtraOffsetsWithLeft:0 top:0 right:0 bottom:0];

    _chartView.highlightPerTapEnabled = YES;
    _chartView.delegate = self;

    _chartView.chartDescription.enabled = NO;
    
    //当图表完全缩小的时候，每一次拖动都会高亮显示在图标视图上。默认YES
        self.chartView.highlightPerDragEnabled = YES;
        //设置最大高亮距离（dp）。在图表中的点击位置距离条目的距离超过此距离不会触发高亮显示。默认500
        self.chartView.maxHighlightDistance = 20;
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
    self.chartView.fitBars = YES;
     self.chartView.legend.enabled = NO;//是否显示图例
    //仅适用于堆叠式(stacked)，当为YES时，点击圆柱时即使只选中了一个堆栈条目，也会高亮整条圆柱。默认NO
//    self.chartView.highlightFullBarEnabled = YES;
//    self.chartView.maxHighlightDistance = 1000;
    

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
      xAxis.labelTextColor =  leftAxis.labelTextColor;
    xAxis.axisLineColor =  leftAxis.axisLineColor;
     xAxis.axisLineWidth =  0;
    xAxis.labelPosition = XAxisLabelPositionBottom;
   xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = self.xAxisValueFormatter;

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
       
    [self drawData];
    
    
    
      
    NSMutableArray * arr = [NSMutableArray array];
          
          for (int i = 0; i<2; i++) {
              GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
              if (i == 0) {
                  selectModel.color = gateColor(@"e75475");
                  selectModel.shape = square;
              }
              if (i == 1) {
                  selectModel.color =gateColor(@"5bc39b");
                  selectModel.shape = square;
              }
              [arr addObject:selectModel];
      }
    
      
         self.bottomPublicSelectView.arr = arr;
         [self.bottomSelectView addSubview:self.bottomPublicSelectView];
          self.bottomPublicSelectView.selectIndex = 0;
    }



-(GatePublicSelectView *)bottomPublicSelectView{
    if (!_bottomPublicSelectView) {
        _bottomPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, 220, 30)];
        _bottomPublicSelectView.centerX = scrWeiht/2;
        _bottomPublicSelectView.checkboxEnabled = YES;
       
        
         @weakify(self)
        _bottomPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            @strongify(self)
                       BarChartDataSet * set =  (BarChartDataSet *) self.chartView.barData.dataSets[index];
            set.visible = !publicSelectModel.selectEnabled;
                       [self.chartView setNeedsDisplay];
        };
        
     }
    return _bottomPublicSelectView;
}



 -(void)drawData{
        NSArray *datas = @[@100,@90,@76,@100,@90,@76,@100,@90,@76,@100,@90,@76,@100,@90,@76,@100,@90,@76,@100,@90,@76,@100,@90,];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < datas.count; i++) {
//            BarChartDataEntry *entry = [[BarChartDataEntry alloc] initWithX:i yValues:@[[datas[i] integerValue],[datas[i] integerValue]]];
            double mult = (59 + 1);
                  double val1 = (double) (arc4random_uniform(mult) + mult / 3);
                  double val2 = (double) (arc4random_uniform(mult) + mult / 3);
            
            
              [array addObject:[[BarChartDataEntry alloc] initWithX:i yValues:@[@(val1), @(val2)] icon: [UIImage imageNamed:@"icon"]]];
//            [array addObject:entry];
        }
        //set
        BarChartDataSet *set = [[BarChartDataSet alloc] initWithEntries:array label:@"Bar DataSet"];
     set.stackLabels = @[@"Births", @"Divorces"];
//      set.barBorderWidth = 1.0;
//        [set setColors:@[UIColor.redColor,UIColor.blackColor,UIColor.cyanColor]];
         set.colors = @[gateColor(@"5bc39b"),gateColor(@"e75475")];
        //显示柱图值并格式化
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.positiveSuffix = @"分";
        ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numberFormatter];
        [set setValueFormatter:formatter];
//        set.highlightEnabled = YES;
         set.drawValuesEnabled = NO; //圆柱上是否显示文字
        BarChartData *data = [[BarChartData alloc] initWithDataSet:set];
          [data setBarWidth:0.5];
        self.chartView.data = data;
    }

    #pragma mark - ChartViewDelegate
    #pragma mark 图表中数值被选中
    -(void)chartValueSelected:(ChartViewBase *)chartView entry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight{
        
    //    NSLog(@"图表中数值被选中");
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




@end
