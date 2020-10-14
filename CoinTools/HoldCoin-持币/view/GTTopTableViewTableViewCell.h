//
//  GTTopTableViewTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTTopTableViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *top5Lb;
@property (weak, nonatomic) IBOutlet UILabel *ratioLb;

@end

NS_ASSUME_NONNULL_END
