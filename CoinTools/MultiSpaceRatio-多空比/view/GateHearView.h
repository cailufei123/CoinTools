//
//  GateHearView.h
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GateHearView : UIView
+(GateHearView * )getGateHearView;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UIButton *moreBt;
@end

NS_ASSUME_NONNULL_END
