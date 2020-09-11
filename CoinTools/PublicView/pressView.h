//
//  pressView.h
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface pressView : UIView
-(void)updataPrgress:(CGFloat)prgress;
@property(nonatomic,strong) UILabel * fisrtLb ;
@property(nonatomic,strong) UILabel * lastLb ;
@end

NS_ASSUME_NONNULL_END
