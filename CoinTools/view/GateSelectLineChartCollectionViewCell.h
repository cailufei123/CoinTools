//
//  GateSelectLineChartCollectionViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateSelectLineChartCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *selectBt;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UIView *innerView;
- (void)reloadSelectCell;
- (void)reloadUnSelectCell:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
