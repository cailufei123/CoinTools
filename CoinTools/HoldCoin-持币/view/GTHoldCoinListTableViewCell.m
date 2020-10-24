//
//  GTHoldCoinListTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/15.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHoldCoinListTableViewCell.h"

@implementation GTHoldCoinListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.chibiLb.font =  self.chicangLb.font =  self.day7.font = self.chackBt.font = gateFont(14, Normal);

}

- (IBAction)addressAction:(id)sender {
    
    !_didPresentBlock?:_didPresentBlock(@"22");
    static int a = 0 ;
    BOOL hovizonal = ++a%2 ;
   
    AlertAnimationType aniType =hovizonal ? AlertAnimationTypeFade : AlertAnimationTypeBounce ;
    UIColor *tintC = hovizonal ? [UIColor groupTableViewBackgroundColor] : [UIColor cyanColor] ;
    
    
    EasyAlertView *alertV1 =  [EasyAlertView alertViewWithPart:^EasyAlertPart *{
        return [EasyAlertPart shared].setTitle(@"请点击两下").setSubtitle(@"1，点击背景是否接受事件\，改变动画类型。\，只有两个按钮的时候，是横排还是竖排.\n4，改变背景颜色").setAlertType(AlertViewTypeAlert) ;
    } config:^EasyAlertConfig *{
        return [EasyAlertConfig shared].settwoItemHorizontal(hovizonal).setAnimationType(AlertAnimationTypeZoom).setTintColor([UIColor redColor]).setBgViewEvent(NO).setSubtitleTextAligment(NSTextAlignmentLeft) ;
    } buttonArray:^NSArray<NSString *> *{
        return @[@"确定",@"取消"] ;
    } callback:^(EasyAlertView *showview , long index) {
        index ? [EasyTextView showSuccessText:@"点击了取消"] : [EasyTextView showText:@"点击了确定"];
    }];
    [alertV1 showAlertView];
    
    //第一步 创建alertview
    EasyAlertView *alertV = [EasyAlertView alertViewWithPart:^EasyAlertPart *{
        return [EasyAlertPart shared].setTitle(@"标题").setSubtitle(@"这是副标题").setAlertType(AlertViewTypeActionSheet) ;
    } config:nil buttonArray:nil callback:^(EasyAlertView *showview, long index) {
        NSLog(@"点击了 index = %ld",index );
    }];
    
    //第二步 添加上面的按钮
    [alertV addAlertItemWithTitleArray:@[@"这是家的",@"zitfalsj",@"发开始放假"] callback:nil];
    [alertV addAlertItem:^EasyAlertItem *{
        return [EasyAlertItem itemWithTitle:@"红色粗体" type:AlertItemTypeBlodRed callback:^(EasyAlertView *showview, long index) {
            //因为上面已经加了一个全局的回调，所以这个地方是不会回调的
            NSLog(@"红色粗体 = %ld",index );
        }];
    }];
    
    //第三步  显示alertview
    [alertV showAlertView];
   
}
@end
