//
//  GTNewTopDuiBiCollectionViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYLineProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GTNewTopDuiBiCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *duibiLb;
@property (weak, nonatomic) IBOutlet SYLineProgressView *lineProgressView;

@end

NS_ASSUME_NONNULL_END
