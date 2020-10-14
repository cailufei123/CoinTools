//
//  GTHoldCoinPieChartViewTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHoldCoinPieChartViewTableViewCell.h"
#import "GTTopTableViewTableViewCell.h"
@implementation GTHoldCoinPieChartViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
  //设置偏移
     
       self.topTableView.delegate = self;
    self.topTableView.dataSource = self;
       //无内容显示
       _pieChartView.noDataText = @"";
       //关闭描述
       _pieChartView.chartDescription.enabled = NO;
       _pieChartView.chartDescription.text = @"tiny`s barChart demo";
       //关闭图例
       _pieChartView.legend.enabled = NO;
       //将数据转换为百分比
       _pieChartView.usePercentValuesEnabled = YES;
       //惯性
       _pieChartView.dragDecelerationFrictionCoef = 0.5;  //0 1 惯性
       //设置中间文字
       _pieChartView.drawCenterTextEnabled = NO;
       _pieChartView.centerText = @"我是中间文字";
       //显示扇形区域文字
       _pieChartView.drawEntryLabelsEnabled = NO;
       //可以旋转
       _pieChartView.rotationEnabled = NO;
       //扇区可点击
       _pieChartView.highlightPerTapEnabled = YES;
       //代理
       _pieChartView.delegate = self;
       
       ChartLegend *l = _pieChartView.legend;
       l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
       l.verticalAlignment = ChartLegendVerticalAlignmentTop;
       l.orientation = ChartLegendOrientationVertical;
       l.drawInside = NO;
       l.xEntrySpace = 7.0;
       l.yEntrySpace = 0.0;
       l.yOffset = 0.0;
       
       // entry label styling
       _pieChartView.entryLabelColor = UIColor.whiteColor;
       _pieChartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
       
[_pieChartView setExtraOffsetsWithLeft:0 top:0 right:0 bottom:0];
     
       
       [_pieChartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    [self setDataCount:10 range:30];
}

- (void)setDataCount:(int)count range:(double)range
{
    double mult = range;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        
        
        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:@"333" icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithEntries:values label:@"Election Results"];
    
    dataSet.drawIconsEnabled = NO;
    
  
    dataSet.iconsOffset = CGPointMake(0, 40);
    //相邻区块之间的间距
    dataSet.sliceSpace = 2;
    //扇形区域放大范围
    dataSet.selectionShift = 5;
    //动画开始的角度
    // add a lot of colors
  dataSet.drawValuesEnabled = NO; // 是否绘制显示数据
   



    dataSet.selectionShift = 8;// 2.设置PieChartDataSet缩放系数
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    NSArray * arr = @[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor purpleColor]];
    [colors addObjectsFromArray:arr];
//   [colors addObjectsFromArray:ChartColorTemplates.joyful];
//    [colors addObjectsFromArray:ChartColorTemplates.colorful];
//    [colors addObjectsFromArray:ChartColorTemplates.liberty];
//    [colors addObjectsFromArray:ChartColorTemplates.pastel];
//    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
//
    dataSet.colors = colors;
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [data setValueTextColor:UIColor.whiteColor];
    
    _pieChartView.data = data;
    [_pieChartView highlightValues:nil];
    [_pieChartView animateWithXAxisDuration:2.0f easingOption:ChartEasingOptionEaseOutExpo];
    
    self.topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    gateTableRegisterNib(self.topTableView, @"GTTopTableViewTableViewCell");
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5 ;
}



  -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 40;

  }
  -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
      
      GTTopTableViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTTopTableViewTableViewCell" forIndexPath:indexPath];
      cell.colorView.backgroundColor = KRANDOM_COLOR;
      if (indexPath.row == 0) {
          cell.top5Lb.text = @"TOP5地址";
          cell.ratioLb.text = @"持币占比";
          cell.colorView.hidden = YES;
      }else{
         
          cell.top5Lb.text = @"2222";
          cell.ratioLb.text = @"34";
        cell.colorView.hidden = NO;
      }
     
        return cell;
     
  }
 


@end

