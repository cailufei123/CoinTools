//
//  GateHomePageTopEnterViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateHomePageTopEnterViewCell : UITableViewCell
@property(nonatomic,strong)void(^selectBlock)(NSInteger index);

@property(nonatomic,strong)GTHomepageboxModel * homepagebox;//
@property(nonatomic,strong)UILabel * lb;
@end

NS_ASSUME_NONNULL_END
