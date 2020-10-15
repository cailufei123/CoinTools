//
//  GTNewTopDuiBiCollectionViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTNewTopDuiBiCollectionViewCell.h"

@implementation GTNewTopDuiBiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLb.textColor = self.duibiLb.textColor  =  gateColor(@"333B46");
    self.titleLb.font = self.duibiLb.font = gateFont(11, Normal);
    self.titleLb.font = gateFont(12, Medium);
    
     self.lineProgressView.layer.cornerRadius = 3;
      self.lineProgressView.lineWidth = 0.0;
      self.lineProgressView.lineColor = [UIColor redColor];
      self.lineProgressView.progressColor = gateColor(@"3790eb");
      self.lineProgressView.defaultColor = gateColor(@"ff0400");;
      self.lineProgressView.label.textColor = [UIColor greenColor];
      self.lineProgressView.label.hidden = YES;
      self.lineProgressView.animationText = YES;
      [self.lineProgressView initializeProgress];
       self.bgView.backgroundColor = gateColor(@"ffe6e5");
}

-(void)setAlldatalistModel:(GTAlldatalistModel *)alldatalistModel{
    
    
 
       self.titleLb.text = alldatalistModel.title.content;
       self.titleLb.textColor =   gateColor(alldatalistModel.title.color);
       self.titleLb.font = gateFont(alldatalistModel.title.size, alldatalistModel.title.blod?Medium: Normal);
       [GTStyleManager setStyleWhit:alldatalistModel.title forLale:self.titleLb];

    
       GTHomeTitleModel * homeTitleModel1  =  [GTDataManager getItemModelWhit:alldatalistModel.datalist.firstObject].firstObject;
       self.duibiLb.text = homeTitleModel1.content;
       self.duibiLb.textColor =   gateColor(homeTitleModel1.color);
       self.duibiLb.font = gateFont(homeTitleModel1.size,homeTitleModel1.blod?Medium: Normal);
       [GTStyleManager setStyleWhit:homeTitleModel1 forLale:self.duibiLb];
       NSString *string = homeTitleModel1.content;



    NSArray *array = [string componentsSeparatedByString:@" : "]; //从字符A中分隔成2个元素的数组
    if (array.count>1) {
        NSCharacterSet * set =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];

        CGFloat second1=[[array.firstObject stringByTrimmingCharactersInSet:set] floatValue];
        CGFloat second2=[[array.lastObject stringByTrimmingCharactersInSet:set] floatValue];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
              self.lineProgressView.progress =    second1 * 1/(second1 + second2);
        });

    }
}
@end
