//
//  GTHoldCoinListTableViewCell.h
//  CoinTools
//
//  Created by MAC on 2020/9/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTHoldCoinListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *chibiLb;
@property (weak, nonatomic) IBOutlet UILabel *chicangLb;
@property (weak, nonatomic) IBOutlet UILabel *day7;
@property (weak, nonatomic) IBOutlet UILabel *chackBt;
- (IBAction)addressAction:(id)sender;
@property (nonatomic, copy) void (^didPresentBlock)(NSString * str);
@property(nonatomic,strong)GTPublicContentModel * holdCoinModel;
@property(nonatomic,strong)NSIndexPath * indexPath;
@property(nonatomic,assign)NSInteger  tagIndex;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLyout;
@property (weak, nonatomic) IBOutlet UIButton *dayBt;
- (IBAction)datBtAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
