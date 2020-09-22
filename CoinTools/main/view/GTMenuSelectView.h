//
//  GTMenuSelectView.h
//  CoinTools
//
//  Created by MAC on 2020/9/18.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMenuSelectView : UIView
@property(nonatomic,strong)void(^selectBlockItme)(NSInteger index,BOOL isClose);
@property(nonatomic,strong)UIButton * closeButton;
@property (nonatomic, strong) NSArray *titles;
-(void)selectUICollectionViewitem:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
