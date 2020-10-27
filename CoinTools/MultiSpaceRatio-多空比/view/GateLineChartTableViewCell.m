//
//  GateLineChartTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateLineChartTableViewCell.h"
#import "GateYAxisValueFormatter.h"
#import "GateXAxisValueFormatter.h"
#import "GateYAxisValueFormatter.h"
#import "GateSelectLineChartCollectionViewCell.h"
#import <CoinTools/CoinTools-Swift.h>

@interface GateLineChartTableViewCell ()
@property(nonatomic,strong)GateXAxisValueFormatter * xAxisValueFormatter ;
@property(nonatomic,strong)GateYAxisValueFormatter * yAxisValueFormatter ;
@property(nonatomic,strong)UILabel * markYLabel ;
//@property(nonatomic,strong) BalloonMarker * markers;
@property(nonatomic,strong) NSMutableArray * colors;
@property (nonatomic, strong) NSIndexPath *selectIndexPath;
@property(nonatomic,strong) GatePublicSelectView * bottomPublicSelectView;
@end
@implementation GateLineChartTableViewCell
-(GateXAxisValueFormatter *)xAxisValueFormatter{
    if (!_xAxisValueFormatter) {
        _xAxisValueFormatter = [GateXAxisValueFormatter getGateXAxisValueFormatter];
    }
    return _xAxisValueFormatter;
}
-(GateYAxisValueFormatter *)yAxisValueFormatter{
    if (!_yAxisValueFormatter) {
        _yAxisValueFormatter = [GateYAxisValueFormatter getGateYAxisValueFormatter];
    }
    return _yAxisValueFormatter;
}

- (UILabel *)markYLabel {
    
    if (!_markYLabel) {
        _markYLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -5, 100, 100)];
        _markYLabel.font = [UIFont systemFontOfSize:15.0];
        _markYLabel.textAlignment = NSTextAlignmentCenter;
        _markYLabel.text = @"";
        _markYLabel.textColor = [UIColor whiteColor];
        _markYLabel.backgroundColor = [UIColor grayColor];
    }
    return _markYLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
   
            // 设置基本样式
            self.lineChartView.backgroundColor = [UIColor colorWithRed:230/255.0f green:253/255.0f blue:253/255.0f alpha:1];
     self.lineChartView.backgroundColor = [UIColor whiteColor];
            self.lineChartView.delegate = self;                                         // 设置代理，需遵守 ChartViewDelegate 协议
            self.lineChartView.noDataText = @"暂无数据";

            // 设置交互样式
            self.lineChartView.scaleYEnabled = NO;                                      // 取消 Y 轴缩放
            self.lineChartView.doubleTapToZoomEnabled = NO;                             // 取消双击缩放
            self.lineChartView.dragEnabled = YES;                                       // 启用拖拽图标
            self.lineChartView.dragDecelerationEnabled = YES;                           // 拖拽后是否有惯性效果
            self.lineChartView.dragDecelerationFrictionCoef = 0.9;
    // 拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
            self.lineChartView.drawMarkers  = YES;

            // 设置滑动时 Y 值标签
//                          ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
//                          markerY.offset = CGPointMake(-999, -8);
//                          markerY.chartView = self.lineChartView;
//                         [markerY addSubview:self.markYLabel];
//                          markerY.chartView = self.lineChartView;
//                          self.lineChartView.marker = markerY;

            // 设置 X 轴样式
            ChartXAxis *xAxis = self.lineChartView.xAxis;
            xAxis.labelPosition = XAxisLabelPositionBottom;                             // 设置 X 轴的显示位置，默认是显示在上面的
            xAxis.axisLineWidth = 1.0 / [UIScreen mainScreen].scale;                    // 设置 X 轴线宽
                             // 设置 X 轴颜色
            xAxis.granularityEnabled = YES;                                             // 设置重复的值不显示
            xAxis.valueFormatter = self.xAxisValueFormatter;                  // label 文字样式，自定义格式，默认时不显示特殊符号
            xAxis.labelTextColor = gateColor(axislabelTextColor);   // label 文字颜色
            xAxis.drawGridLinesEnabled = NO;
            xAxis.axisLineColor = gateColor(gateGridColor);
            xAxis.axisMinimum = -0.5;
//            xAxis.labelRotationAngle = 40;
//    xAxis.labelRotatedWidth = 100;
//            xAxis.gridColor = [UIColor clearColor];                                     // 网格线颜色
//    xAxis.axisMinimum = -1;                                                  // 设置 Y 轴的最小值
//    xAxis.axisMaximum = 105;
            // 设置 Y 轴样式
            self.lineChartView.rightAxis.enabled = NO;                                  // 不绘制右边轴
            ChartYAxis *leftAxis = self.lineChartView.leftAxis;
            leftAxis.zeroLineColor = gateColor(gateGridColor);
            //显示网格线。默认YES
               leftAxis.drawGridLinesEnabled = YES;
               //网格线的颜色
               leftAxis.gridColor = gateColor(gateGridColor);
               //网格线的宽度。默认0.5
               leftAxis.gridLineWidth = 1;
               leftAxis.gridLineDashPhase = 0;
               //网格线的虚线效果，间距值
               leftAxis.gridLineDashLengths = @[];// 获取左边 Y 轴
            leftAxis.inverted = NO;                                                     // 是否将 Y 轴进行上下翻转
//                          leftAxis.axisMinValue = -10;                                                  // 设置 Y 轴的最小值
//                          leftAxis.axisMaxValue = 105;                                                // 设置 Y 轴的最大值
            leftAxis.axisLineWidth = 1.0 / [UIScreen mainScreen].scale;                 // 设置 Y 轴线宽
            leftAxis.axisLineColor = gateColor(gateGridColor);                              // 设置 Y 轴颜色
            leftAxis.labelPosition = YAxisLabelPositionOutsideChart;                    // label 文字位置
            leftAxis.valueFormatter = self.yAxisValueFormatter;               // label 文字样式，自定义格式，默认时不显示特殊符号
            leftAxis.labelTextColor =  gateColor(axislabelTextColor);  // label 文字颜色
            leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];                       // label 文字字体
//            leftAxis.labelCount = 5;                                                    // label 数量，数值不一定，
                                                                                  // 如果 forceLabelsEnabled 等于 YES,
                                                                                  // 则强制绘制制定数量的 label, 但是可能不平均
            leftAxis.forceLabelsEnabled = NO;                                           // 不强制绘制指定数量的 label
//            leftAxis.gridLineDashLengths = @[@3.0f, @3.0f];                             // 设置虚线样式的网格线
//            leftAxis.gridColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];    // 网格线颜色
            leftAxis.gridAntialiasEnabled = YES;                                        // 网格线开启抗锯齿

            // 添加限制线
            ChartLimitLine *limitLine = [[ChartLimitLine alloc] initWithLimit:80 label:@"限制线"];     // 设置限制值和标题
            limitLine.lineWidth = 2;                                                    // 限制线的宽度
            limitLine.lineColor = [UIColor greenColor];                                 // 限制线的颜色
            limitLine.lineDashLengths = @[@5.0f, @5.0f];                                // 虚线样式
            limitLine.labelPosition = ChartLimitLabelPositionTopRight;                  // label 位置
            limitLine.valueTextColor = [UIColor colorWithHexString:@"#057748"];            // label 文字颜色
            limitLine.valueFont = [UIFont systemFontOfSize:12];                         // label 字体
            [xAxis addLimitLine:limitLine];                                          // 添加到 Y 轴上
            xAxis.drawLimitLinesBehindDataEnabled = NO;                             // 设置限制线绘制在折线图的下面

            // 设置折线图描述
     self.lineChartView.chartDescription.text = @"";
        self.lineChartView.chartDescription.enabled = NO;
//            self.lineChartView.chartDescription.enabled = NO;                          // 显示折线图描述，默认 YES 显示
            //              self.lineChartView.descriptionText = @"折线图";                              // 折线图描述
            //              self.lineChartView.descriptionFont = [UIFont systemFontOfSize:15];          // 折线图描述字体
            //              self.lineChartView.descriptionTextColor = [UIColor darkGrayColor];          // 折线图描述颜色

            // 设置折线图图例
            self.lineChartView.legend.enabled = NO;                                    // 显示图例，默认 YES 显示
            self.lineChartView.legend.form = ChartLegendFormLine;                       // 图例的样式
            self.lineChartView.legend.formSize = 30;                                    // 图例中线条的长度
            self.lineChartView.legend.textColor = [UIColor darkGrayColor];              // 图例文字颜色

    
    
//    BalloonMarker *marker = [[BalloonMarker alloc]
//                              initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
//                              font: [UIFont systemFontOfSize:12.0]
//                              textColor: UIColor.whiteColor
//                              insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
    
    
//      ChartMarkerImage * mark = [[ChartMarkerImage alloc] init];
//    mark.image = getImage(@"AppIcon_40x40_@2x");
//    mark.chartView = self.lineChartView;
//    mark.offset = CGPointMake(100, 100);
//      self.lineChartView.marker = mark;
    
    
//    self. markers.chartView = self.lineChartView;
//    self. markers.minimumSize = CGSizeMake(80.f, 40.f);
//    self.lineChartView.marker = self.markers;
// self.markers.offset = CGPointMake(100, 100);
//     self.markers.image = getImage(@"AppIcon_40x40_@2x");
     self.lineChartView.legend.form = ChartLegendFormLine;
            // 设置动画效果，可以设置 X 轴和 Y 轴的动画效果
            [self.lineChartView animateWithXAxisDuration:1.0f];
    [self setCollectionView];
    
    
    
    
     
   
         [self.topSelectView addSubview:self.bottomPublicSelectView];
        
   
}

-(GatePublicSelectView *)bottomPublicSelectView{
    if (!_bottomPublicSelectView) {
        _bottomPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 10, scrWeiht-60, 30)];
        _bottomPublicSelectView.centerX = scrWeiht/2;
        _bottomPublicSelectView.backgroundColor = [UIColor whiteColor];
        _bottomPublicSelectView.checkboxEnabled = YES;
         @weakify(self)
        _bottomPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            @strongify(self)

//                 GateDiffLineModel * diffLineModel = self.possArr[index];
             

            NSArray * lineChartDataSets = self.lineChartView.lineData.dataSets;
              LineChartDataSet *set1 = lineChartDataSets[index];
             
//            set1.visible = !diffLineModel.selectEnabled;
//              [self.collectionView reloadData];
                [self.lineChartView setNeedsDisplay];
            
        };
        
     }
    return _bottomPublicSelectView;
}
//
//-(BalloonMarker *)markers{
//    if (!_markers) {
//
//        _markers = [[BalloonMarker alloc]
//                    initWithColor:[[UIColor blackColor]colorWithAlphaComponent:0.7 ]
//        font: [UIFont systemFontOfSize:12.0]
//        textColor: UIColor.whiteColor
//        insets: UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)];
//        _markers.image =getImage(@"icon_logon_d_logo_145x51_@3x");
//    }
//    return  _markers;
//}
- (void)setData
{
    
//      self.colors = [NSMutableArray array];
//      double leftAxisMin = 0;
//      double leftAxisMax = 0;
//     LineChartData *chartData = [[LineChartData alloc] init];
//    for (int i = 0; i<self.possArr.count; i++) {
//
//        GateDiffLineModel * diffLineModel = self.possArr[i];
//
//
//           NSMutableArray *array = [NSMutableArray array];
//        for (int i = 0; i < diffLineModel.line.count; i++) {
//               //创建ChartDataEntry对象并将每个点对应的值与x轴 y轴进行绑定
//               ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:[[diffLineModel.line[i] lastObject] integerValue]];
//
//
//                      double val = [[diffLineModel.line[i] lastObject] integerValue];
//            leftAxisMax = MAX(val, leftAxisMax);
//            leftAxisMin = MIN(val, leftAxisMax);
//               [array addObject:entry];
//           }
//
//        [chartData addDataSet:[self createLineChartDataSet:array color:diffLineModel.color]];
////  [_chartView moveViewToX:self.weights.count];// 移动到那个点
//
//    }
//    self.lineChartView.rightAxis.axisMinimum = leftAxisMin;
//     self.lineChartView.rightAxis.axisMaximum = leftAxisMax;
//
//    [self.lineChartView setVisibleXRangeMaximum:3.0];
   
//     self.lineChartView.data = chartData;
    
//  [ self.lineChartView moveViewToX:3];// 移动到那个点
}

-(LineChartDataSet *)createLineChartDataSet:(NSMutableArray *)datas color:(UIColor * )color{
     //创建一个集合并为这个集合赋值 label的值可为空
            LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithEntries:datas label:@"Line DataSet"];
            //折线颜色
       // 设置折线的样式
              
                set1.lineWidth = 2;                     // 折线宽度
                [set1 setColor:[UIColor colorWithHexString:@"#007FFF"]];
                [set1 setColor:color]; // 折线颜色
                set1.drawValuesEnabled = NO;                                           // 是否在拐点处显示数据，默认 YES
                set1.valueColors = @[[UIColor brownColor]];                             // 折线拐点处显示数据的颜色
               set1.drawFilledEnabled = NO;                                           // 是否开启绘制阶梯样式的折线图，默认 NO
                // set1.valueFormatter = [[ChartMaxDataValueFormatter alloc] initWithYDataVals:chartVals1];  // 设置数据显示的格式，只显示最大值
     
                // 折线拐点样式
                set1.drawCirclesEnabled = NO;                                          // 是否绘制拐点，默认 YES
                set1.circleRadius = 4.0f;                                               // 拐点半径
                set1.circleColors = @[[UIColor redColor], [UIColor greenColor]];        // 拐点颜色
               
                // 拐点中间的空心样式
                set1.drawCircleHoleEnabled = NO;                                       // 是否绘制中间的空心，默认 YES
                set1.circleHoleRadius = 2.0f;                                           // 空心的半径
                set1.circleHoleColor = [UIColor blackColor];                            // 空心的颜色
       set1.circleHoleColor = color;
                // 折线的颜色填充样式
   
                // 第一种填充样式:单色填充
                // set1.drawFilledEnabled = YES;                                           // 是否填充颜色，默认 NO
                // set1.fillColor = [UIColor redColor];                                    // 填充颜色
                // set1.fillAlpha = 0.3;                                                   // 填充颜色的透明度
     
                // 第二种填充样式:渐变填充
                set1.drawFilledEnabled = NO;                                           // 是否填充颜色，默认 NO
                NSArray *gradientColors = @[(id)[ChartColorTemplates colorFromString:@"#FFFFFFFF"].CGColor,
                                            (id)[ChartColorTemplates colorFromString:@"#FF007FFF"].CGColor];
                CGGradientRef gradientRef = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
                set1.fill = [ChartFill fillWithLinearGradient:gradientRef angle:90.0f]; // 赋值填充颜色对象
                CGGradientRelease(gradientRef);                                         // 释放 gradientRef
                set1.fillAlpha = 0.3f;                                                  // 透明度
   
     set1.drawHorizontalHighlightIndicatorEnabled = NO;
                // 点击选中拐点的交互样式
                set1.highlightEnabled = YES;                                            // 选中拐点，是否开启高亮效果(显示十字线)，默认 YES
               set1.highlightColor = [[UIColor colorWithHexString:@"#c83c23"] colorWithAlphaComponent:0.3];             // 点击选中拐点的十字线的颜色
                set1.highlightLineWidth = 20.0 / [UIScreen mainScreen].scale;            // 十字线宽度
                set1.highlightLineDashLengths = @[@0, @0];
                set1.highlightLineWidth = 15;
        
        //创建容器
            LineChartData *chartData = [[LineChartData alloc] init];
    [chartData addDataSet:set1];
   return set1;
        //将数据添加到图中 注意这里可以是多条线  [chartData addDataSet:set]
           
//        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//            numberFormatter.numberStyle = kCFNumberFormatterDecimalStyle;
//
//        //    if (rightAxis>=1000000) {
//        //        numberFormatter.multiplier   = @0.000001;
//        //        numberFormatter.positiveSuffix = @"M";
//        //    }else{
//        //        numberFormatter.multiplier   = @0.001;
//        //        numberFormatter.positiveSuffix = @"k";
//        //    }
//            numberFormatter.multiplier   = @0.001;
//            numberFormatter.positiveSuffix = @"K";
//        self.chartView.rightAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc]initWithFormatter:numberFormatter];
//              self.chartView.xAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc]initWithFormatter:numberFormatter];
//
//    //        self.chartView.leftAxis.axisMinValue = 0;//设置Y轴的最小值
//    //        self.chartView.leftAxis.axisMaxValue = leftAxisMax;//设置Y轴的最大值
//    //         self.chartView.data = chartData;
//    //        LineChartData *data = [[LineChartData alloc] initWithDataSets:datas];
//            self.chartView.data = chartData;
//         self.chartView.data = chartData;
//         [self.chartView.data addDataSet:<#(id<IChartDataSet> _Null_unspecified)#>]
    //        NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    //        pFormatter.numberStyle = kCFNumberFormatterDecimalStyle;
    //        // 小数位数(销量小数位0)
    ////        pFormatter.maximumFractionDigits = self.M.isCuv?0:2;
    //
    //        [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];

//            [self.chartView animateWithYAxisDuration:0.3f];r
    
}



#pragma mark - IChartAxisValueFormatter delegate (y轴值) (x轴的值写在DateValueFormatter类里, 都是这个协议方法)
- (NSString *)stringForValue:(double)value entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler *)viewPortHandler{
     return @"333---";
}
-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis{
    NSLog(@"%-------lf",value);
     NSLog(@"%-------lf", axis.spaceMax);
   
    
   return @"333";
}
//- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
////    if (self.yIsPercent) {
////        return [NSString stringWithFormat:@"%.1f%%", value];
////    }
//    if (ABS(value) > 1000) {
//        return [NSString stringWithFormat:@"%.1fk", value/(double)1000];
//    }
//
//    return [NSString stringWithFormat:@"%.f", value];
//}
// #pragma make- IChartAxisValueFormatter
// - (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis{
//
//     return @"333";
// }


//-(NSMutableArray *)tempPossArr{
//    if (!_tempPossArr) {
//        _tempPossArr = [NSMutableArray array];
//    }
//    return _tempPossArr;
//}

//-(void)setPossArr:(NSArray<GateDiffLineModel *> *)possArr{
//    _possArr = possArr;
//    self.xAxisValueFormatter.possArr = possArr;
//     self.yAxisValueFormatter.possArr = possArr;
//    self.markers.possArr = possArr;
//
//
////    self.collectionLyoutH.constant = ((possArr.count + 3 - 1) /3) * 40;
////    [self.collectionView reloadData];
//    [self.tempPossArr removeAllObjects];
//    for (int i = 0; i<possArr.count; i++) {
//        GateDiffLineModel * lineModel = possArr[i];
//        if (i == 0) {
//          lineModel.color = UIColor.redColor;
//        }
//        if (i ==1) {
//           lineModel.color = UIColor.greenColor;
//        }
//        if (i ==2) {
//            lineModel.color = UIColor.blueColor;
//        }
//
//        lineModel.shape = circular;
//        lineModel.titleText = lineModel.name;
//        [self.tempPossArr addObject:lineModel];
//    }
//
//
//
//            self.bottomPublicSelectView.arr = self.tempPossArr;
//    if (possArr.count>0) {
//            [self setData];
//           [self.lineChartView.data notifyDataChanged];
//           [self.lineChartView notifyDataSetChanged];
//       }
//
//
//
//}

//贝塞尔
- (UIImage *)QS_getCornerRadius:(CGFloat)c im:(UIImage*)rrr
{
   UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
    imageView.image = rrr;
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];

    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
     //结束画图
    UIGraphicsEndImageContext();
    return  imageView.image;
}
- (void)chartValueSelected:(ChartViewBase * _Nonnull)chartView
                     entry:(ChartDataEntry * _Nonnull)entry
                 highlight:(ChartHighlight * _Nonnull)highlight {
//     LineChartDataSet *set = [LineChartDataSet ]
//    IChartDataSet
   
    NSArray * lineChartDataSets = self.lineChartView.lineData.dataSets;

    NSInteger  x = entry.x;
    
    for (LineChartDataSet *set in lineChartDataSets) {
        
        for ( ChartDataEntry *entry in set.entries) { entry.icon = nil; }
     
    }
    for (int i =0; i<lineChartDataSets.count; i++) {
        
        LineChartDataSet *set = lineChartDataSets[i];
        
        ChartDataEntry *entry = set.entries[ x ];
        UIView * rr = [[UIView alloc] init];
       
        rr.layer.borderWidth = 1;
        rr.layer.cornerRadius = 3;
        rr.layer.masksToBounds = YES;
        rr.backgroundColor = [UIColor whiteColor];
        rr.size = CGSizeMake(6, 6);
//        rr.layer.borderColor = UIColor.redColor.CGColor;
//          GateDiffLineModel * lineModel = self.tempPossArr[i];
//        rr.layer.borderColor = lineModel.color.CGColor;
        UIImage * ic  = [UIImage convertViewToImage:rr];
       
        entry.icon =[ic  wh_imageAddCornerWithRadius:rr.size.height/2 andSize:rr.size];;
    }
    
//    LineChartDataSet * ee =   [self.lineChartView.data getDataSetByIndex:highlight.dataSetIndex];
////    ee.highlightColor = UIColor.purpleColor;
//     ee.circleHoleColor = [UIColor purpleColor];
//     CombinedChartData *data = [[CombinedChartData alloc] init];
//    // 设置滑动时 Y 值标签
////    self.markYLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)entry.y];
//    
//    // 将点击的数据滑动到中间
//    [self.lineChartView centerViewToAnimatedWithXValue:entry.x
//                                                yValue:entry.y
//                                                  axis:[self.lineChartView.data
//                                                        getDataSetByIndex:highlight.dataSetIndex].axisDependency
//                                                                 duration:1.0];
//    
//    
//    self.lineChartView.xAxis.axisMaximum = data.xMax + 0.25;
//
//      
//    ScatterChartData *d = [[ScatterChartData alloc] init];
//      data.scatterData = d;
//    NSMutableArray *entries = [[NSMutableArray alloc] init];
//    
//    for (double index = 0; index < 50; index += 1)
//    {
//        [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.25 y:(arc4random_uniform(550000000) + 1)]];
//    }
//    
//    ScatterChartDataSet *set = [[ScatterChartDataSet alloc] initWithEntries:entries label:@"Scatter DataSet"];
//    set.colors = ChartColorTemplates.material;
//    set.scatterShapeSize = 4.5;
//    [set setDrawValuesEnabled:NO];
//    set.valueFont = [UIFont systemFontOfSize:10.f];
//    
//    [d addDataSet:set];
//    
//     self.lineChartView.data = data;
    
}
- (void)chartValueNothingSelected:(ChartViewBase * _Nonnull)chartView{
     NSArray * lineChartDataSets = self.lineChartView.lineData.dataSets;
    for (LineChartDataSet *set in lineChartDataSets) {
        
        for ( ChartDataEntry *entry in set.entries) { entry.icon = nil; }
     
    }
}


-(void)setCollectionView{
    
     UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
               layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
               layout.minimumLineSpacing =0;
               layout.minimumInteritemSpacing =0;
               layout.scrollDirection = UICollectionViewScrollDirectionVertical;
               layout.itemSize = CGSizeMake((scrWeiht)/3, 40);
               [ self.collectionView setCollectionViewLayout:layout];
               self.collectionView.backgroundColor = [UIColor whiteColor];
    gateCollectionRegisterNib(self.collectionView, @"GateSelectLineChartCollectionViewCell");
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
   
    
}
#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateSelectLineChartCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateSelectLineChartCollectionViewCell" forIndexPath:indexPath];
//    GateDiffLineModel * diffLineModel = self.possArr[indexPath.item];
//    NSArray * lineChartDataSets = self.lineChartView.lineData.dataSets;
//       LineChartDataSet *set1 = lineChartDataSets[indexPath.row];
//    cell.nameLb.text = diffLineModel.name;
// 
//    cell.selectBt.backgroundColor = diffLineModel.color?:self.colors[indexPath.row];
//    
//    if (diffLineModel.color && diffLineModel.color == [UIColor whiteColor]) {
//        set1.visible = NO;
//       
//    }else{
//         set1.visible = YES;
//    }

    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//
//       GateDiffLineModel * diffLineModel = self.possArr[indexPath.item];
//
//
//  NSArray * lineChartDataSets = self.lineChartView.lineData.dataSets;
//    LineChartDataSet *set1 = lineChartDataSets[indexPath.row];
//
//    if ( diffLineModel.color == [UIColor whiteColor]) {
//        diffLineModel.color = self.colors[indexPath.item];
//         set1.visible = YES;
//    }else{
//        diffLineModel.color = [UIColor whiteColor];
//         set1.visible = NO;
//    }
//
//    [self.collectionView reloadData];
//      [self.lineChartView setNeedsDisplay];
}

@end

