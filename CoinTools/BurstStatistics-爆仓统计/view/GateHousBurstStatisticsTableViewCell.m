//
//  GateHousBurstStatisticsTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHousBurstStatisticsTableViewCell.h"

@implementation GateHousBurstStatisticsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   self.lineProgressView.layer.cornerRadius = 5;
    self.lineProgressView.lineWidth = 0.0;
    self.lineProgressView.lineColor = [UIColor redColor];
    self.lineProgressView.progressColor = gateColor(@"51c99c");
    self.lineProgressView.defaultColor = gateColor(@"eef2f6");;
    self.lineProgressView.label.textColor = [UIColor greenColor];
    self.lineProgressView.label.hidden = YES;
    self.lineProgressView.animationText = YES;
    [self.lineProgressView initializeProgress];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         double val = ((double)arc4random() / UINT32_MAX);
//        self.lineProgressView.progress = val;
//
//    });
    
    self.titleLb.text = @"Houbi合约";
    self.moneyLb.text = @"$2155万";self.titleLb.textColor =  self.moneyLb.textColor = self.progressLb.textColor = gateColor(@"363a5a");
    self.moneyLb.font = self.progressLb.font = self.titleLb.font = gateFont(14, Normal);
}
-(void)setBurstbourse:(GTPublicContentModel *)burstbourse{
    _burstbourse = burstbourse;
    [self.icopnImageView setImageWithURL:urlWhitString([GTDataManager getItemModelWhit:burstbourse.alldatalist[0].datalist.firstObject][self.indexPath.row].url) placeholder:getPlaceholderImage];
    self.titleLb.text = [GTDataManager getItemModelWhit:burstbourse.alldatalist[0].datalist.firstObject][self.indexPath.row].content;
    [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:burstbourse.alldatalist[0].datalist.firstObject][self.indexPath.row] forLale: self.titleLb];
    
    self.moneyLb.text = [GTDataManager getItemModelWhit:burstbourse.alldatalist[1].datalist.firstObject][self.indexPath.row].content;
    [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:burstbourse.alldatalist[1].datalist.firstObject][self.indexPath.row] forLale: self.moneyLb];
    
    self.progressLb.text =[NSString stringWithFormat:@"%0.2lf%%",[[GTDataManager getItemModelWhit:burstbourse.alldatalist[2].datalist.firstObject][self.indexPath.row].content doubleValue]*100] ;
    [GTStyleManager setStyleWhit: [GTDataManager getItemModelWhit:burstbourse.alldatalist[2].datalist.firstObject][self.indexPath.row] forLale: self.progressLb];
    
//    self.moneyLb.text = bcoin_coin_burst_exchange_infoModel.burst_amt;
//    self.progressLb.text = [NSString stringWithFormat:@"%0.2lf%%",[bcoin_coin_burst_exchange_infoModel.exchange_amt_rate doubleValue]*100];
//    if ([bcoin_coin_burst_exchange_infoModel.exchange_amt_rate doubleValue]>=1) {
//          self.progressLb.text = @"100%";
//    }
    if ([[GTDataManager getItemModelWhit:burstbourse.alldatalist[1].datalist.firstObject][self.indexPath.row].content doubleValue]>10000) {
         self.moneyLb.text = [NSString stringWithFormat:@"%0.2lf万",[[GTDataManager getItemModelWhit:burstbourse.alldatalist[1].datalist.firstObject][self.indexPath.row].content doubleValue]/10000];
    }
      self.lineProgressView.progress =  [[GTDataManager getItemModelWhit:burstbourse.alldatalist[2].datalist.firstObject][self.indexPath.row].content doubleValue];
}



@end
