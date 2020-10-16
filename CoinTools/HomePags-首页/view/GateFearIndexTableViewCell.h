//
//  GateFearIndexTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateFearIndexTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tuiMg;
@property(nonatomic,strong)GTHomevixModel * homevix;//
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@end

NS_ASSUME_NONNULL_END
