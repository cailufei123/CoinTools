//
//  GTDotManager.m
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTDotManager.h"

@implementation GTDotManager
+ (void)chartDotManagerValueSelected:(CombinedChartView * _Nonnull)chartView
entry:(ChartDataEntry * _Nonnull)entry
                           highlight:(ChartHighlight * _Nonnull)highlight publicSelectModels:(NSArray *  )selectModels{
    
    
     NSArray * lineChartDataSets = chartView.lineData.dataSets;

        NSInteger  x = entry.x;
        
        for (LineChartDataSet *set in lineChartDataSets) {
            
            for ( ChartDataEntry *entry in set.entries) { entry.icon = nil; }
         
        }
        for (int i =0; i<lineChartDataSets.count; i++) {
            
            LineChartDataSet *set = lineChartDataSets[i];
            ChartDataEntry *entry = set.entries[ x ];
            UIView * rr = [[UIView alloc] init];
           
            rr.layer.borderWidth = 2;
            rr.layer.cornerRadius = 5;
            rr.layer.masksToBounds = YES;
            rr.backgroundColor = [UIColor whiteColor];
            rr.size = CGSizeMake(10, 10);

    //         self.topPublicSelectView.arr = arr;
            GatePublicSelectModel * selectModel1 = selectModels[i];
            rr.layer.borderColor = selectModel1.color.CGColor;
            UIImage * ic  = [UIImage convertViewToImage:rr];
           
            entry.icon =[ic  wh_imageAddCornerWithRadius:rr.size.height/2 andSize:rr.size];;
        }
    
}
@end
