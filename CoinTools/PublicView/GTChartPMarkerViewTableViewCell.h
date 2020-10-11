//
//  GTChartPMarkerViewTableViewCell.h
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTChartPMarkerViewTableViewCell : UITableViewCell
@property(nonatomic,strong)GatePublicSelectModel * publicSelectModel;
@property (weak, nonatomic) IBOutlet UILabel *textLb;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLyout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rgithLyout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLyout;
@end

NS_ASSUME_NONNULL_END
