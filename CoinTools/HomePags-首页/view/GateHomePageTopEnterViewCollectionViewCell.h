//
//  GateHomePageTopEnterViewCollectionViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateHomePageTopEnterViewCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *bagView;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@property (weak, nonatomic) IBOutlet UILabel *twentyFourHourNumberLb;

@end

NS_ASSUME_NONNULL_END
