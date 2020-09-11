//
//  GateBurstHouseTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateBurstHouseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *housSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *directionSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *priceSpacing;
@property (weak, nonatomic) IBOutlet UILabel *housLb;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *directionLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *totalLb;
@property(nonatomic,strong)NSArray * littes;
@property(nonatomic,strong)NSMutableArray * lables;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
- (void)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath setLittes:(NSArray *)littes;
@end

NS_ASSUME_NONNULL_END
