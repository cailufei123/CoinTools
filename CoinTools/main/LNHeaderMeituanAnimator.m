//
//  LNHeaderMeituanAnimator.m
//  LNRefresh
//
//  Created by vvusu on 8/28/17.
//  Copyright © 2017 vvusu. All rights reserved.
//

#import "LNHeaderMeituanAnimator.h"
#define instanceIncremental 60
@interface LNHeaderMeituanAnimator()
@property (nonatomic, assign) CGRect GifViewRect;
@property (nonatomic, strong) UIImageView *meituanGifView;
@end

@implementation LNHeaderMeituanAnimator

+ (instancetype)createAnimator {
    LNHeaderMeituanAnimator *diyAnimator = [[LNHeaderMeituanAnimator alloc]init];
    diyAnimator.headerType = LNRefreshHeaderType_DIY;
    diyAnimator.trigger = 64;
    diyAnimator.incremental = instanceIncremental;
    return diyAnimator;
}

- (UIImageView *)meituanGifView {
    if (!_meituanGifView) {
        _meituanGifView = [[UIImageView alloc]init];
    }
    return _meituanGifView;
}

- (void)setupHeaderView_DIY {
    [self.animatorView addSubview:self.meituanGifView];
    self.meituanGifView.image = [UIImage imageNamed:@"CoinTools.framework/GateScources.bundle/RefreshImage/loading_0_30x30_@3x"];
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 0; i <= 30; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"CoinTools.framework/GateScources.bundle/RefreshImage/loading_%zd_30x30_@3x",i]];
        [idleImages addObject:image];
    }
    self.meituanGifView.animationImages = idleImages;
    self.meituanGifView.animationDuration = 1;
}

- (void)layoutHeaderView_DIY {
    if (self.state == LNRefreshState_Normal) {
        CGRect react = self.animatorView.frame;
        self.GifViewRect = CGRectMake(react.size.width/2.0, react.size.height , 0, 0);
        self.meituanGifView.frame = self.GifViewRect;
    }
}

- (void)refreshHeaderView_DIY:(LNRefreshComponent *)view state:(LNRefreshState)state {
    switch (state) {
        case LNRefreshState_Normal:
            break;
        case LNRefreshState_PullToRefresh:
            break;
        case LNRefreshState_WillRefresh:
        case LNRefreshState_Refreshing:
            [self startRefreshAnimation_DIY:view];
            break;
        default:
            break;
    }
}

- (void)startRefreshAnimation_DIY:(LNRefreshComponent *)view {
    [self refreshView_DIY:nil progress:1];
    [self.meituanGifView startAnimating];
}

//- (void)refreshView_DIY:(LNRefreshComponent *)view progress:(CGFloat)progress {
//    if (progress > 1.0) { return; }
//    self.meituanGifView.frame = CGRectMake(self.GifViewRect.origin.x - 84*progress,
//                                           self.GifViewRect.origin.y - 64.0*progress,
//                                           self.GifViewRect.size.width + 168*progress,
//                                           self.GifViewRect.size.height + 64.0*progress);
//}
- (void)refreshView_DIY:(LNRefreshComponent *)view progress:(CGFloat)progress {
    if (progress > 1.0) { return; }
    self.meituanGifView.frame = CGRectMake(self.GifViewRect.origin.x ,
                                           self.GifViewRect.origin.y - 35.0*progress,
                                           self.GifViewRect.size.width + 30*progress,
                                           self.GifViewRect.size.height + 30*progress);
    
    self.meituanGifView.centerX = self.animatorView.centerX;
    self.meituanGifView.centerY = instanceIncremental/2;
}

@end
