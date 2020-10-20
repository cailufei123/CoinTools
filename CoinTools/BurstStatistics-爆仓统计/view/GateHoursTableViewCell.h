//
//  GateHoursTableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateHoursTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *messageLB;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property(nonatomic,strong)GTPublicContentModel * burstinfo;
@property (weak, nonatomic) IBOutlet UIView *bagView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loyoutH;
@end

NS_ASSUME_NONNULL_END
