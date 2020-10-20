//
//  GateBurstListTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBurstModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateBurstListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UIImageView *iocnImageView;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *jiduLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb1;
@property (weak, nonatomic) IBOutlet UILabel *tageLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb2;
@property (weak, nonatomic) IBOutlet UILabel *sheetLb;
@property(nonatomic,strong)GTPublicContentModel * burstdtl;
@property(nonatomic,strong) NSIndexPath * indexPath;
@end

NS_ASSUME_NONNULL_END
