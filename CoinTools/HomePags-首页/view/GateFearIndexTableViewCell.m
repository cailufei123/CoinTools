//
//  GateFearIndexTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateFearIndexTableViewCell.h"
#import "ZZDottedLineProgress.h"

@interface GateFearIndexTableViewCell()

@property (weak, nonatomic) IBOutlet ZZDottedLineProgress *prgressView;

@end
@implementation GateFearIndexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    _progressView = [[ZZDottedLineProgress alloc] initWithFrame:CGRectMake(0, 0, 300, 300) startColor:[UIColor greenColor] endColor:[UIColor greenColor] startAngle:90 strokeWidth:4 strokeLength:20];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          self.prgressView.startColor = [UIColor redColor];
              self.prgressView.endColor = [UIColor orangeColor];
              self.prgressView.startAngle = 90;
              self.prgressView.strokeWidth = 10;
            self.prgressView.strokeLength = 0;
        //    self.prgressView.center = self.view.center;
            //    _progressView.backgroundColor = [UIColor blackColor];
                self.prgressView.roundStyle = YES;
            //    _progressView.colorGradient = NO;
                self.prgressView.showProgressText = YES;
            //    _progressView.increaseFromLast = YES;
            //    _progressView.notAnimated = YES;
                self.prgressView.subdivCount = 90;
            //    _progressView.animationDuration = 3;
            //    _progressView.progress = 0.5;
        //        [self.view addSubview:self.prgressView];
            self.prgressView.pathBackColor  = [UIColor redColor];
                   self.prgressView.backgroundColor  = [UIColor cyanColor];
            self.prgressView.progress = 0.7;
    });
  
    
}


@end
