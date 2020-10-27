//
//  GTFearIndexIndicatorTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/13.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTFearIndexIndicatorTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *IndicatorView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property(nonatomic,strong)GTHomevixModel * homevix;//


@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UILabel *yesterDayTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *LastMonthTitleLb;

@property (weak, nonatomic) IBOutlet UILabel *yesterDayLb;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekLb;
@property (weak, nonatomic) IBOutlet UILabel *LastMonthLb;
@property (weak, nonatomic) IBOutlet UILabel *totayFearIndexLb;
@property (weak, nonatomic) IBOutlet UILabel *timeTitleLb;
@end

NS_ASSUME_NONNULL_END
