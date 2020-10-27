//
//  GTTopTotalTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTTopTotalTableViewCell.h"
@implementation GTTopTotalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.lineProgressView.layer.cornerRadius = 10;
     self.lineProgressView.lineWidth = 0.0;
     self.lineProgressView.lineColor = [UIColor redColor];
     self.lineProgressView.progressColor = gateColor(@"549aef");
     self.lineProgressView.defaultColor = gateColor(@"e04d5a");;
     self.lineProgressView.label.textColor = [UIColor greenColor];
     self.lineProgressView.label.hidden = YES;
     self.lineProgressView.animationText = YES;
     [self.lineProgressView initializeProgress];
   
   
    
    self.kongLb.textColor = self.duoLb.textColor = gateColor(@"989898");
    self.duoLb.font = gateFont(13, Medium);
    self.kongLb.font = gateFont(13, Medium);
    
    NSMutableAttributedString * attr = [@"多 54.69%" getMutableAttributedStringWhitSearchString:@"54.69%" searchStringColor:gateColor(@"ec5d76") searchStringFont:gateFont(16, Medium)];
    self.kongLb.attributedText = attr;
     self.duoLb.attributedText = attr;
    
}
-(void)setLsalldtl:(GTPublicContentModel *)lsalldtl{
    _lsalldtl = lsalldtl;
  
    self.duoLb.text = [NSString stringWithFormat:@"%0.2lf%%",[[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row].content doubleValue]*100];
    
    self.douTitleLb.text = [NSString stringWithFormat:@"%@:",[GTDataManager getLanguageData:@"duo"]];
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row] forLale:self.duoLb];
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row] forLale:self.douTitleLb];
    self.douTitleLb.textColor = gateColor(@"333333");
    
    self.kongTitleLb.text =[NSString stringWithFormat:@"%@:",[GTDataManager getLanguageData:@"kong"]] ;
   
    self.lineProgressView.progress = [[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row].content doubleValue];
  
    self.kongLb.text =  [NSString stringWithFormat:@"%0.2lf%%",[[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+2].datalist.firstObject][self.indexPath.row].content doubleValue]*100];
    self.backgroundColor = [UIColor whiteColor];
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+2].datalist.firstObject][self.indexPath.row] forLale: self.kongLb];
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row] forLale: self.kongTitleLb];
    self.kongTitleLb.textColor = gateColor(@"333333");
     
}


@end
