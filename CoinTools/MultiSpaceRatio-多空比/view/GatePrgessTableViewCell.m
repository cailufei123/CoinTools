//
//  GatePrgessTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GatePrgessTableViewCell.h"

 
@implementation GatePrgessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
        self.press = [[pressView alloc] initWithFrame:CGRectMake(0, 0, scrWeiht-30, 40)];

        [self.progressView addSubview: self.press];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [ self.press updataPrgress:[@"0.6" doubleValue]];
    });
        
}
-(void)setLsalldtl:(GTPublicContentModel *)lsalldtl{
  
    _lsalldtl =  lsalldtl;
    [self.userImageView setImageWithURL:urlWhitString( [GTDataManager getItemModelWhit:self.lsalldtl.alldatalist[self.indexPath.section *3].datalist.firstObject][self.indexPath.row].url) placeholder:getPlaceholderImage];
    
    self.userNameLb.text = [GTDataManager getItemModelWhit:self.lsalldtl.alldatalist[self.indexPath.section *3].datalist.firstObject][self.indexPath.row].content;
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:self.lsalldtl.alldatalist[self.indexPath.section *3].datalist.firstObject][self.indexPath.row] forLale:self.userNameLb];

    [self.press updataPrgress:[[GTDataManager getItemModelWhit:self.lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row].content doubleValue]] ;
    self.press.fisrtLb.text =  [NSString stringWithFormat:@"%0.2lf%%",[[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row].content doubleValue]*100];;
    
    self.press.lastLb.text =   [NSString stringWithFormat:@"%0.2lf%%",[[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+2].datalist.firstObject][self.indexPath.row].content doubleValue]*100];
    
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+1].datalist.firstObject][self.indexPath.row] forLale: self.press.fisrtLb];
    
    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:lsalldtl.alldatalist[self.indexPath.section *3+2].datalist.firstObject][self.indexPath.row] forLale: self.press.lastLb];
   
}


@end
