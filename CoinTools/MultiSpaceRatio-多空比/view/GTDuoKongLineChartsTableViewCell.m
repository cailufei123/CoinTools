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
#import "GTDotManager.h"
@import Charts;
@interface GTDuoKongLineChartsTableViewCell() <ChartViewDelegate, IChartAxisValueFormatter>

@property (weak, nonatomic) IBOutlet GTSwitchBt *switchBt;
@property (weak, nonatomic) IBOutlet CombinedChartView *chartView;
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;
@property(nonatomic,strong) GTXAxisFearIndexValueFormatter * xXisFearIndexValueFormatter;
@property(nonatomic,strong)  GTYxisFearIndexValueFormatter *  yLeftXisFearIndexValueFormatter;
@property(nonatomic,strong) GTYxisFearIndexValueFormatter * yXisFearIndexValueFormatter;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property(nonatomic,strong) GTChartPMarkerView * marker;
@property(nonatomic,strong)NSMutableArray * temps;
@property(nonatomic,strong)NSMutableArray * styleArr;
@property(nonatomic,strong)NSMutableArray * allstyleArr;
@property (weak, nonatomic) IBOutlet GTScreenBt *screenBt;
@end
@implementation GTDuoKongLineChartsTableViewCell
+(instancetype)loadTableViewCell{
    return  loadXib;
}
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
    _chartView.dragXEnabled = YES;
//  _chartView.rightAxis.enabled = NO;
    ChartYAxis *rightAxis = _chartView.rightAxis;
    _chartView.rightAxis.enabled = YES;
//    _chartView.maxVisibleCount = 1000;
    
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
    self.yLeftXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
       self.yLeftXisFearIndexValueFormatter .formatterType = GTFormatterYLeftAxisDuoKong;
       leftAxis.valueFormatter = self.yLeftXisFearIndexValueFormatter ;
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
    
    GTChartPMarkerView * marker = [GTStyleManager getChartPMarkerViewWhit];
    marker.chartView =  self.chartView;
    marker.aleartType = GTChartPMarkerViewCalendarPermissionChiCang;
    self.marker = marker;
    self.chartView.marker = marker;
    [self.selectView addSubview:self.topPublicSelectView];
    marker.xAxisValueFormatter = self.xXisFearIndexValueFormatter;
     
      [self.chartView animateWithXAxisDuration:2.0f];
    
    self.chartView.scaleYEnabled = NO;                                      // 取消 Y 轴缩放
    self.chartView.dragEnabled = YES;
    self.chartView.scaleXEnabled = YES;
    [self.selectView addSubview:self.topPublicSelectView];
   
    @weakify(self)
    self.switchBt.selectBlock = ^(BOOL select) {
        @strongify(self)
      
        self.duoKongData.isSelected = select;
        
        [self setChartData];
        
        self.duoKongData = self.duoKongData;
        
    };
   
    self.screenBt.selectBlock = ^(BOOL select) {
        @strongify(self)
        !self.selectBlock?:self.selectBlock();
        
    };
  
}


-(void)setDuoKongData:(GTPublicContentModel *)duoKongData{
    _duoKongData = duoKongData;
    self.switchBt.selected = duoKongData.isSelected;
    if (!self.switchBt.isSelected) {
       
        self.switchBt.backgroundColor = gateColor(@"5064f2");
  
    }else{
        
        self.switchBt.backgroundColor = gateColor(@"f6f9fb");
 
    }
    
    NSMutableArray * arr = [NSMutableArray array];
    self.temps =  [NSMutableArray array];

          for (int i = 1; i<duoKongData.alldatalist.count; i++) {
              GTHomeTitleModel * title = duoKongData.alldatalist[i].title;
              GTHomeTitleModel * titleModel = [GTDataManager getItemModelWhit:duoKongData.alldatalist[i].datalist.firstObject].firstObject;
              GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
              selectModel.color = gateColor(titleModel.color);
              selectModel.titleText = title.content;
              [arr addObject:selectModel];
              [self.temps addObject:selectModel];

  
      }
    
    self.xXisFearIndexValueFormatter.publicArry = [GTDataManager getItemModelWhit:duoKongData.alldatalist.firstObject.datalist.firstObject];

    
    self.topPublicSelectView.arr = arr;
    [self setChartData];
    
}



-(GatePublicSelectView *)topPublicSelectView{
  if (!_topPublicSelectView) {
      _topPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht-60, 50)];
      _topPublicSelectView.centerX = scrWeiht/2;
      _topPublicSelectView.checkboxEnabled = YES;
       @weakify(self)
      _topPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
          @strongify(self)
//            LineChartDataSet * set =  (LineChartDataSet *) self.chartView.lineData.dataSets[index];
//            set.visible = !publicSelectModel.selectEnabled;
//
//
//
//            NSMutableArray * styleArr1 = [NSMutableArray array];
//            for (int i = 0; i<self.chartView.lineData.dataSets.count; i++) {
//            LineChartDataSet * set1 = (LineChartDataSet *) self.chartView.lineData.dataSets[i];
//            if (set1.isVisible) {
//             [styleArr1 addObject:self.allstyleArr[i]];
//          }
//      }
          
          NSMutableArray * styleArr1 = [NSMutableArray array];
          
          if (self.duoKongData.isSelected) {
              BarChartDataSet * set =  (BarChartDataSet *) self.chartView.barData.dataSets[index];
              set.visible = !publicSelectModel.selectEnabled;
            
              for (int i = 0; i<self.chartView.barData.dataSets.count; i++) {
                  BarChartDataSet * set1 = (BarChartDataSet *) self.chartView.barData.dataSets[i];
                  if (set1.isVisible) {
                      [styleArr1 addObject:self.allstyleArr[i]];
                  }
                  
              }
          }else{
              LineChartDataSet * set =  (LineChartDataSet *) self.chartView.lineData.dataSets[index];
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




- (void)setChartData
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
   // 全局并发队列的获取方法
//     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//      dispatch_async(queue), ^{
//          // 这里放异步执行任务代码
//      });
    @weakify(self)
// [self generateLineDataBlock:^(LineChartData *lineChartData) {
     
//     @strongify(self)
//     dispatch_async(dispatch_get_main_queue(), ^{
//         data.lineData  = lineChartData;
//         self.chartView.data = data;
//         [self.chartView.data notifyDataChanged];
// //               [self.chartView notifyDataSetChanged];
//                [self.chartView setNeedsDisplay];
// //              [self.chartView animateWithXAxisDuration:2];
//         _chartView.xAxis.axisMinimum = data.xMin + 0.25;
//         _chartView.xAxis.axisMaximum = data.xMax + 0.5;
//
//     });
//}];
//
//
//
//
//
//    CombinedChartData *data = [[CombinedChartData alloc] init];
//
//    data.lineData = [self generateLineData];
//    CombinedChartData *data = [[CombinedChartData alloc] init];
//     @weakify(self)
    if (!_duoKongData.isSelected) {
       
     [self generateLineDataBlock:^(LineChartData *lineChartData) {

         @strongify(self)
         dispatch_async(dispatch_get_main_queue(), ^{
             data.lineData  = lineChartData;
             self.chartView.data = data;
             [self.chartView.data notifyDataChanged];
     //               [self.chartView notifyDataSetChanged];
                    [self.chartView setNeedsDisplay];
     //              [self.chartView animateWithXAxisDuration:2];
             self.chartView.xAxis.axisMinimum = data.xMin + 0.25;
             self.chartView.xAxis.axisMaximum = data.xMax + 0.25;

         });
    }];
    }else{
      
     [self generateBarDataBlock:^(BarChartData *lineChartData) {

         @strongify(self)
         dispatch_async(dispatch_get_main_queue(), ^{
             data.barData  = lineChartData;
             self.chartView.data = data;
             [self.chartView.data notifyDataChanged];
     //               [self.chartView notifyDataSetChanged];
                    [self.chartView setNeedsDisplay];
     //              [self.chartView animateWithXAxisDuration:2];
             self.chartView.xAxis.axisMinimum = data.xMin + 0.25;
             self.chartView.xAxis.axisMaximum = data.xMax + 0.25;

         });
    }];
    }

}


- (BarChartData *)generateBarDataBlock:(void(^)(BarChartData * lineChartData))finishblock{
    BarChartData *d = [[BarChartData alloc] init];
         [d setBarWidth:0.5];
    
     dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
   
        
        double leftAxisMin = MAXFLOAT;
        double leftAxisMax = 0;
       double rightAxisMin = MAXFLOAT;
       double rightAxisMax = 0;
  for (int i = 1; i<self.duoKongData.alldatalist.count; i++) {
     NSArray< GTHomeTitleModel *> * models = [GTDataManager getItemModelWhit:self.duoKongData.alldatalist[i].datalist.firstObject];
      NSMutableArray *entries = [[NSMutableArray alloc] init];
      NSLog(@"%@",models);
      for (int index = 0; index<models.count; index++) {
          GTHomeTitleModel * titleModel  = models[index];
          if (i == 1) {
             
              double val = [titleModel.content doubleValue];
              rightAxisMax   = MAX(val, rightAxisMax);
              rightAxisMin   = MIN(val, rightAxisMin);
          }else{
              double val = [titleModel.content doubleValue];
              leftAxisMax = MAX(val, leftAxisMax);
              leftAxisMin = MIN(val, leftAxisMin);
          }
//              [titleModel.content doubleValue]
//              arc4random_uniform(250) + 25
          [entries addObject:[[BarChartDataEntry alloc] initWithX:index  y:([titleModel.content doubleValue])]];
     }
     
      BarChartDataSet * set1 = [self getArr:entries barChartDataSet:gateColor(models.firstObject.color) drawFilledEnabled:NO];
    
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
        
        float groupSpace = 0.08f;
        float barSpace = 0.03f;
        [d groupBarsFromX: self.chartView.xAxis.axisMinimum  groupSpace: 1 barSpace: barSpace];
        
        
        
        
        finishblock(d);
        
     });
   
    return d;
}

-(BarChartDataSet *)getArr:(NSMutableArray *)entries barChartDataSet:(UIColor * )color drawFilledEnabled:(BOOL)drawFilledEnabled{
    BarChartDataSet *set =  [[BarChartDataSet alloc] initWithEntries:entries label:@"Company A"];
    set.drawValuesEnabled = NO;
    [set setColor:color];
    return set;
}

- (LineChartData *)generateLineDataBlock:(void(^)(LineChartData * lineChartData))finishblock
{
    LineChartData *d = [[LineChartData alloc] init];

     NSMutableArray *entries = [[NSMutableArray alloc] init];
      NSMutableArray *entries1 = [[NSMutableArray alloc] init];
    
    
   dispatch_queue_t queueT = dispatch_queue_create("group.queue", DISPATCH_QUEUE_CONCURRENT);//一个并发队列
   dispatch_group_t grpupT = dispatch_group_create();//一个线程组
   
    
//    dispatch_group_async(grpupT, queueT, ^{
//        NSLog(@"group——当前线程一");
//        //模仿网络请求代码
//        dispatch_group_enter(grpupT);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
//            for (int index = 0; index < self.bcoin_coin_long_short_infos.count; index++){
//                    
//                   bcoin_coin_long_short_infoModel * bcoin_btc_vix_data_infoModel =  self.bcoin_coin_long_short_infos[index];
//                 
//                     [entries addObject:[[ChartDataEntry alloc] initWithX:index   y:[bcoin_btc_vix_data_infoModel.offer doubleValue]]];
//            [entries1 addObject:[[ChartDataEntry alloc] initWithX:index   y:[bcoin_btc_vix_data_infoModel.long_rate doubleValue]]];
//                   
//                 
//
//               }
            
//            dispatch_group_leave(grpupT);
            
            
//              LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(@"8734d9")];
//              set1.axisDependency = AxisDependencyRight;
//
//              LineChartDataSet * set2 = [self getArr:entries1 lineChartDataSet:gateColor(@"5a7dee")];
//                  set2.axisDependency = AxisDependencyLeft;
//               [d addDataSet:set1];
//                [d addDataSet:set2];
            
            
            
            
            
            
            
            
            double leftAxisMin = MAXFLOAT;
            double leftAxisMax = 0;
           double rightAxisMin = MAXFLOAT;
           double rightAxisMax = 0;
      for (int i = 1; i<self.duoKongData.alldatalist.count; i++) {
         NSArray< GTHomeTitleModel *> * models = [GTDataManager getItemModelWhit:self.duoKongData.alldatalist[i].datalist.firstObject];
          NSMutableArray *entries = [[NSMutableArray alloc] init];
          NSLog(@"%@",models);
          for (int index = 0; index<models.count; index++) {
              GTHomeTitleModel * titleModel  = models[index];
             
              if (i == 1) {
                 
                  double val = [titleModel.content doubleValue];
                  rightAxisMax   = MAX(val, rightAxisMax);
                  rightAxisMin   = MIN(val, rightAxisMin);
              }else{
                  double val = [titleModel.content doubleValue];
                  leftAxisMax = MAX(val, leftAxisMax);
                  leftAxisMin = MIN(val, leftAxisMin);
              }
//              [titleModel.content doubleValue]
//              arc4random_uniform(250) + 25
              [entries addObject:[[ChartDataEntry alloc] initWithX:index  y:([titleModel.content doubleValue])]];
         }
         
          LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(models.firstObject.color) drawFilledEnabled:NO];
        
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
            
            
            
            
            
            
            finishblock(d);
            
        });

//    });
    
//    dispatch_group_notify(grpupT, queueT, ^{
//
//        NSLog(@"此时还是在子线程中");
////        dispatch_async(dispatch_get_main_queue(), ^{
////            NSLog(@"回到主线程");
//
//
//              LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor(@"8734d9")];
//              set1.axisDependency = AxisDependencyRight;
//            
//              LineChartDataSet * set2 = [self getArr:entries1 lineChartDataSet:gateColor(@"5a7dee")];
//                  set2.axisDependency = AxisDependencyLeft;
//               [d addDataSet:set1];
//                [d addDataSet:set2];
//            finishblock(d);
//
////        });
//
//    });
   
     
          
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


- (void)chartValueSelected:(ChartViewBase * _Nonnull)chartView
                     entry:(ChartDataEntry * _Nonnull)entry
                 highlight:(ChartHighlight * _Nonnull)highlight {

    
    [GTDotManager chartDotManagerValueSelected: self.chartView entry:entry highlight:highlight publicSelectModels:self.topPublicSelectView.arr];
    

//    [self setLineDot:(int)entry.x];
   
    
//    NSArray * lineChartDataSets = self.chartView.lineData.dataSets;
//    for (LineChartDataSet *set in lineChartDataSets) {
//
//        for ( ChartDataEntry *entry in set.entries) { entry.icon = nil; }
//
//    }
//
    NSInteger  x = entry.x;
//
//
//    for (int i =0; i<lineChartDataSets.count; i++) {
//
//        LineChartDataSet *set = lineChartDataSets[i];
//
//        ChartDataEntry *entry = set.entries[ x ];
//        GatePublicSelectModel *  selectModel =  self.temps[i];
//
//        entry.icon = [GTStyleManager  selecrDotStyle:selectModel.color];
//    }
    
    
    [self setLineDot: x];
    
    
    
}
-(void)setLineDot:(NSInteger )index{
   
     NSMutableArray * styleArr = [NSMutableArray array];
     self.allstyleArr = [NSMutableArray array];
    
    self.styleArr = styleArr;
     for (int i = 0; i<self.chartView.data.dataSets.count; i++) {
         
         ChartDataSet * set1 = (ChartDataSet *) self.chartView.data.dataSets[i];
                GTHomeTitleModel * title = self.duoKongData.alldatalist[i+1].title;
                GTHomeTitleModel * titleModel = [GTDataManager getItemModelWhit:self.duoKongData.alldatalist[i+1].datalist.firstObject][index];
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

@end




