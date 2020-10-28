//
//  GateBigOrderDistributionDealCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBigOrderDistributionDealCell.h"
#import "GatePublicSelectView.h"
#import <CoinTools/CoinTools-Swift.h>
@interface GateBigOrderDistributionDealCell ()
@property(nonatomic,strong) GatePublicSelectView * topPublicSelectView;
@property(nonatomic,strong) GatePublicSelectView * bottomPublicSelectView;
@property(nonatomic,strong) NSMutableArray * bigdeal_dists;
@property(nonatomic,strong)GTChartPMarkerView * marker;
@property(nonatomic,strong) GTXAxisFearIndexValueFormatter * xXisFearIndexValueFormatter;
@property(nonatomic,strong)  GTYxisFearIndexValueFormatter *  yLeftXisFearIndexValueFormatter;
@property(nonatomic,strong) GTYxisFearIndexValueFormatter * yXisFearIndexValueFormatter;

@property(nonatomic,assign) NSInteger  selectIndex;
@property(nonatomic,strong) NSString *  jijie;
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
     _chartView.scaleXEnabled = YES;
    _chartView.scaleXEnabled = YES;
    [_chartView setX:10];
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
    self.yLeftXisFearIndexValueFormatter = [GTYxisFearIndexValueFormatter getGTYxisFearIndexValueFormatter];
    leftAxis.valueFormatter = self.yLeftXisFearIndexValueFormatter ;
    ChartXAxis *xAxis = _chartView.xAxis;
//    xAxis.labelPosition = XAxisLabelPositionBothSided;
     xAxis.labelTextColor = gateColor(axislabelTextColor);
    
    xAxis.axisMinimum = 0.0;
      xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    self.xXisFearIndexValueFormatter = [GTXAxisFearIndexValueFormatter getGTXAxisFearIndexValueFormatter];
    self.xXisFearIndexValueFormatter.formatterType = GTFormatterXDaDan;
    xAxis.valueFormatter = self.xXisFearIndexValueFormatter ;
  xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelRotationAngle = 50;
   
   
    GTChartPMarkerView * marker = [GTStyleManager getChartPMarkerViewWhit];
    marker.chartView =  self.chartView;
   marker.aleartType = GTChartPMarkerViewCalendarPermissionDaDan;
    self.marker = marker;
    self.chartView.marker = marker;
 
  
  
  
    marker.xAxisValueFormatter =  self.xXisFearIndexValueFormatter;
      [self.chartView animateWithXAxisDuration:2.0f];
    
    [self.selectView addSubview:self.topPublicSelectView];
    [self.bottomSelectView addSubview:self.bottomPublicSelectView];
       
      
   
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
-(NSMutableArray *)bigdeal_dists{
    if (!_bigdeal_dists) {
        _bigdeal_dists = [NSMutableArray array];
        
    }
    return _bigdeal_dists;
}
-(void)setBigOrderModel:(GTBigOrderModel *)bigOrderModel{
    _bigOrderModel = bigOrderModel;
    [self.bigdeal_dists removeAllObjects];
    if (bigOrderModel.bigdeal_dist_huobi) {
        bigOrderModel.bigdeal_dist_huobi.title = @"Huobo季度";
        [self.bigdeal_dists addObject:bigOrderModel.bigdeal_dist_huobi];
    }
    if (bigOrderModel.bigdeal_dist_okex) {
        bigOrderModel.bigdeal_dist_okex.title = @"oKex季度";
        [self.bigdeal_dists addObject:bigOrderModel.bigdeal_dist_okex];
    }
    if (bigOrderModel.bigdeal_dist_bitmex) {
        bigOrderModel.bigdeal_dist_bitmex.title = @"BitMEX永续";
        [self.bigdeal_dists addObject:bigOrderModel.bigdeal_dist_bitmex];
    }
    if (bigOrderModel.bigdeal_dist_binance) {
        bigOrderModel.bigdeal_dist_binance.title = @"Binance永续";
        [self.bigdeal_dists addObject:bigOrderModel.bigdeal_dist_binance];
    }

    

     NSMutableArray * arr = [NSMutableArray array];
     NSArray * colors = @[@"ff0000",@"eea497",@"ffcc60",@"2c9e67"];
           for (int i = 0; i<self.bigdeal_dists.count; i++) {
               
               GTPublicContentModel *publicContentModel = self.bigdeal_dists[i];
               GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
//               selectModel.color = gateColor([GTDataManager getItemModelWhit:publicContentModel.alldatalist[i].datalist.firstObject].firstObject.color);
               selectModel.color =gateColor(colors[i]);
               selectModel.shape = square;
               selectModel.titleText = publicContentModel.title;
//               publicContentModel.alldatalist[i].title.content;
               [arr addObject:selectModel];
               
       }


   
    self.topPublicSelectView.arr = arr;
   
    self.topPublicSelectView.selectIndex = self.selectIndex;
    GTPublicContentModel *  selectModel1 ;;
    if (self.selectIndex == 0) {
        selectModel1  =  self.bigdeal_dists[0];
        self.jijie = @"Huobi当季";
    }else if(self.selectIndex == 1){
        selectModel1  =  self.bigdeal_dists[1];
        self.jijie = @"Okex当季";
    }else if(self.selectIndex == 2){
        selectModel1  =  self.bigdeal_dists[2];
        self.jijie = @"BitMEX永续";
    }else if(self.selectIndex == 3){
        selectModel1  =  self.bigdeal_dists[3];
        self.jijie = @"Binance永续";
    }
    
   
    self.xXisFearIndexValueFormatter.publicArry = selectModel1.alldatalist.firstObject.datalist;
    [self setChartData:selectModel1];
    
}
-(GatePublicSelectView *)bottomPublicSelectView{
    if (!_bottomPublicSelectView) {
        _bottomPublicSelectView = [[GatePublicSelectView alloc]initWithFrame:CGRectMake(0, 0, scrWeiht, 30)];
        _bottomPublicSelectView.centerX = scrWeiht/2;
        _bottomPublicSelectView.checkboxEnabled = YES;
       
        _bottomPublicSelectView.userInteractionEnabled = NO;
         @weakify(self)
        _bottomPublicSelectView.selectBlock = ^(NSInteger index, GatePublicSelectModel * _Nonnull publicSelectModel) {
            @strongify(self)
//                       BubbleChartDataSet * set =  (BubbleChartDataSet *) self.chartView.bubbleData.dataSets[index];
//            set.visible = !publicSelectModel.selectEnabled;
//                       [self.chartView setNeedsDisplay];
            
            
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
            self.selectIndex = index;
            if (self.selectIndex == 0) {
                self.jijie = @"Huobi当季";
            }else if(self.selectIndex == 1){
                self.jijie = @"Okex当季";
            }else if(self.selectIndex == 2){
                self.jijie = @"BitMEX永续";
            }else if(self.selectIndex == 3){
                self.jijie = @"Binance永续";
            }
            GTPublicContentModel *  selectModel1  =  self.bigdeal_dists[index];
            self.xXisFearIndexValueFormatter.publicArry = selectModel1.alldatalist.firstObject.datalist;
            [self setChartData:self.bigdeal_dists[index]];
        };
        
     }
    return _topPublicSelectView;
  }



- (void)setChartData:(GTPublicContentModel * )publicContentModel
{
    CombinedChartData *data = [[CombinedChartData alloc] init];
    
   
    
   
    @weakify(self)
    [self generateBubbleData:publicContentModel bubbleDataBlock:^(BubbleChartData * bubbleData) {
        @strongify(self)

                     dispatch_async(dispatch_get_main_queue(), ^{
                         data.bubbleData  = bubbleData;
                         self.chartView.data = data;
                         [self.chartView.data notifyDataChanged];
//                          [self.chartView notifyDataSetChanged];
//                        [self.chartView setNeedsDisplay];
                     });

       }];

 [self generate:publicContentModel lineDataBlock:^(LineChartData *lineChartData) {
     @strongify(self)
     dispatch_async(dispatch_get_main_queue(), ^{
        data.lineData  = lineChartData;
        self.chartView.data = data;
        [self.chartView.data notifyDataChanged];
//               [self.chartView setNeedsDisplay];
     });
}];

   
}
- (BubbleChartData *)generateBubbleData:(GTPublicContentModel * )publicContentModel bubbleDataBlock:(void(^)(BubbleChartData * lineChartData))finishblock
{
    
    NSMutableSet * colorSets = [NSMutableSet set];
    BubbleChartData *d = [[BubbleChartData alloc] init];
 
        dispatch_async(dispatch_get_global_queue(0, 0), ^{

            double leftAxisMin = MAXFLOAT;
            double leftAxisMax = 0;
            NSMutableArray *entries = [[NSMutableArray alloc] init];
      for (int i = 0; i<publicContentModel.alldatalist[2].datalist.count; i++) {
           NSArray< GTHomeTitleModel *> * model1s = [GTDataManager getItemModelWhit:publicContentModel.alldatalist[1].datalist[i]];//交易所报价"
          
         NSArray< GTHomeTitleModel *> * model2s = [GTDataManager getItemModelWhit:publicContentModel.alldatalist[2].datalist[i]];//多空报价"
          
            NSArray< GTHomeTitleModel *> * model3s = [GTDataManager getItemModelWhit:publicContentModel.alldatalist[3].datalist[i]];//"成交金额"
          
          
          NSArray< GTHomeTitleModel *> * model4s = [GTDataManager getItemModelWhit:publicContentModel.alldatalist[4].datalist[i]];//"方向"
          
          
          NSString * jidu;  NSString * fangxiang;NSString * jiage;NSString * jiazhi;
          
         
          for (int index = 0; index<model2s.count; index++) {
              GTHomeTitleModel * titleModel1  = model1s[index];
              GTHomeTitleModel * titleModel2  = model2s[index];
              GTHomeTitleModel * titleModel3  = model3s[index];
              GTHomeTitleModel * titleModel4 =  model4s[index];
             
              double val = [titleModel2.content doubleValue];
              if ([titleModel2.content isNotBlank]) {
                  leftAxisMax = MAX(val, leftAxisMax);
                  leftAxisMin = MIN(val, leftAxisMin);
              }
              NSMutableArray * tempArr = [NSMutableArray array];
              
              jidu = self.jijie;
              fangxiang = [NSString stringWithFormat:@"方向:%@",[titleModel4.content isNotBlank]?titleModel4.content:@""];
              jiage = [NSString stringWithFormat:@"价格:%@",[titleModel1.content isNotBlank]?titleModel1.content:@""];
              jiazhi = [NSString stringWithFormat:@"价值:%@",[titleModel3.content isNotBlank]?titleModel3.content:@""];
              
              [tempArr addObject:jidu];[tempArr addObject:fangxiang];[tempArr addObject:jiage];[tempArr addObject:jiazhi];
             
              dispatch_sync(dispatch_get_main_queue(), ^{
                  if ([titleModel2.content isNotBlank]) {
                      UIImage * iamgeColor =    [self  selecrDotStyle:gateColor(titleModel4.color) ];
                      
                      [entries addObject:[[BubbleChartDataEntry alloc] initWithX:i y:val size:50 icon: iamgeColor data:@{@"arr":tempArr,@"color":gateColor(titleModel4.color)}]];
                      [colorSets addObject:@{@"color":titleModel4.color,@"content":titleModel4.content}];

                    
                  }
                 
                 
              });
             

         }
         
        
      }
            BubbleChartDataSet * set1 = [self getArr:entries bubbleChartDataSet:gateColor([GTDataManager getItemModelWhit:publicContentModel.alldatalist[1].datalist.firstObject].firstObject.color) ];
            
            set1.axisDependency = AxisDependencyLeft;
            [d addDataSet:set1];
      self.chartView.leftAxis.axisMinimum = leftAxisMin;
      self.chartView.leftAxis.axisMaximum = leftAxisMax;
     
            
            
            
            NSMutableArray *selectModels = [[NSMutableArray alloc] init];
            NSArray * array2 = [colorSets allObjects];
            for (int i = 0; i<colorSets.count; i++) {
                GatePublicSelectModel *  selectModel = [[GatePublicSelectModel alloc] init];
                selectModel.color =gateColor(array2[i][@"color"]);
                selectModel.shape = square;
                selectModel.titleText = array2[i][@"content"];
 //               publicContentModel.alldatalist[i].title.content;
                [selectModels addObject:selectModel];
              
            }
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.bottomPublicSelectView.arr = (NSMutableArray *)selectModels;
            });
           
            
            finishblock(d);
            
        });


          
    return d;
}
-(UIImage *)selecrDotStyle:(UIColor * )color {
  
    UIView * rr = [[UIView alloc] init];

//    rr.layer.borderWidth = 2;
    rr.layer.cornerRadius = 1;
    rr.layer.masksToBounds = YES;
    rr.backgroundColor = color;
    rr.size = CGSizeMake(6, 6);
    UIImage * ic  = [[UIImage convertViewToImage:rr]  wh_imageAddCornerWithRadius:rr.size.height/2 andSize:rr.size];
   
    return   ic;
  
}

-(BubbleChartDataSet *)getArr:(NSMutableArray *)entries bubbleChartDataSet:(UIColor * )color{
     BubbleChartDataSet *set = [[BubbleChartDataSet alloc] initWithEntries:entries label:@"Bubble DataSet"];
         set.drawIconsEnabled = YES;
    
       

       [set setFormSize:2];

        set.highlightLineWidth = 1;

        [set setColor:UIColor.redColor];

       [set setDrawValuesEnabled:NO];
       [set setColor:UIColor.clearColor];

    return set;
}


- (LineChartData *)generate:(GTPublicContentModel * )publicContentModel lineDataBlock:(void(^)(LineChartData * lineChartData))finishblock
{
    LineChartData *d = [[LineChartData alloc] init];

        dispatch_async(dispatch_get_global_queue(0, 0), ^{

            double leftAxisMin = MAXFLOAT;
            double leftAxisMax = 0;
            NSMutableArray *entries = [[NSMutableArray alloc] init];
      for (int i = 0; i<publicContentModel.alldatalist[1].datalist.count; i++) {
         NSArray< GTHomeTitleModel *> * models = [GTDataManager getItemModelWhit:publicContentModel.alldatalist[1].datalist[i]];
        

          for (int index = 0; index<models.count; index++) {
              GTHomeTitleModel * titleModel  = models[index];
              double val = [titleModel.content doubleValue];
              leftAxisMax = MAX(val, leftAxisMax);
              leftAxisMin = MIN(val, leftAxisMin);
//              [entries addObject:[[ChartDataEntry alloc] initWithX:index + 0.5 y:([getItemModel(publicContentModel.alldatalist[1].datalist)[index].content doubleValue])]];
              [entries addObject:[[ChartDataEntry alloc] initWithX:i  + 0.5 y:(val)]];
              
         }
         
        
      }
            NSLog(@"1----%@",[NSThread currentThread]);
            LineChartDataSet * set1 = [self getArr:entries lineChartDataSet:gateColor([GTDataManager getItemModelWhit:publicContentModel.alldatalist[1].datalist.firstObject].firstObject.color) drawFilledEnabled:NO];
            set1.axisDependency = AxisDependencyRight;
            [d addDataSet:set1];
      self.chartView.rightAxis.axisMinimum = leftAxisMin;
      self.chartView.rightAxis.axisMaximum = leftAxisMax;
     
            finishblock(d);
            
        });


          
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

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    if ([entry isMemberOfClass:[BubbleChartDataEntry class]]) {
        BubbleChartDataEntry *  entry1 =( BubbleChartDataEntry * ) entry;
         NSMutableArray * tempArr = [NSMutableArray array];
        NSDictionary * dict= entry1.data;
         NSMutableArray * entrys =  dict[@"arr"];
        UIColor * color1 =  dict[@"color"];
        
        for (int i = 0; i<entrys.count; i++) {
        [tempArr addObject:@{@"title":entrys[i] ,@"color":gateColor(@"000000")}];
          
        }
     

        self.marker.stylemodels = tempArr;
        
        NSArray * lineChartDataSets = _chartView.bubbleData.dataSets;

         
           
           for (BubbleChartDataSet *set in lineChartDataSets) {
               
               for ( BubbleChartDataEntry *entry3 in set.entries)
               
               {
                   NSDictionary * dict= entry3.data;
                   UIColor * color2 =  dict[@"color"];
//                   [UIView animateWithDuration:1 animations:^{
//
//                   }];
                   entry3.icon = [self selecrDotStyle:color2];
                   
                   
               }
               
           }
        
        
        entry.icon = [self selecrDotStyle22:color1];
    }
   
   
    
     
    
    
   
 
}
-(UIImage *)selecrDotStyle22:(UIColor * )color {
  
    UIView * rr = [[UIView alloc] init];

//    rr.layer.borderWidth = 2;
    rr.layer.cornerRadius = 1;
    rr.layer.masksToBounds = YES;
    rr.backgroundColor = color;
    [UIView animateWithDuration:5 animations:^{
        rr.size = CGSizeMake(10, 10);
    }];
   
 
    
//    rr.layer.borderColor = color.CGColor;
    UIImage * ic  = [[UIImage convertViewToImage:rr]  wh_imageAddCornerWithRadius:rr.size.height/2 andSize:rr.size];
   
    return   ic;
  
}
- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
//    NSLog(@"chartValueNothingSelected");
}

#pragma mark - IAxisValueFormatter

//- (NSString *)stringForValue:(double)value
//                        axis:(ChartAxisBase *)axis
//{
//    return @"344";
//}


@end
