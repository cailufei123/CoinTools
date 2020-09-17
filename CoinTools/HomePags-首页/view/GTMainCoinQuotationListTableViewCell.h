//
//  GTMainCoinQuotationListTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMainCoinQuotationListTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *moreLb;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *rightCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftTableWight;

@end
@interface LeftTableViewTableViewCell : UITableViewCell


@end
NS_ASSUME_NONNULL_END
