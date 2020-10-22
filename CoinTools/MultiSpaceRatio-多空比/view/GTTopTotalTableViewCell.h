//
//  GTTopTotalTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SYLineProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface GTTopTotalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet SYLineProgressView *lineProgressView;
@property (weak, nonatomic) IBOutlet UILabel *duoLb;
@property (weak, nonatomic) IBOutlet UILabel *kongLb;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,strong)GTPublicContentModel * lsalldtl;
@property (weak, nonatomic) IBOutlet UILabel *douTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *kongTitleLb;
@end

NS_ASSUME_NONNULL_END

    
