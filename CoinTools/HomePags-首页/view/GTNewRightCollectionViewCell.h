//
//  GTNewRightCollectionViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/14.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNewRightCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(nonatomic,strong) GTAlldatalistModel * alldatalistModel;
@end

NS_ASSUME_NONNULL_END
