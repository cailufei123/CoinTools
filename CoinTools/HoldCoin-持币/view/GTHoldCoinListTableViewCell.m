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
    self.indexPath.row == 0?:(!_didPresentBlock?:_didPresentBlock(@"22"));
   
}

-(void)setHoldCoinModel:(GTHoldCoinModel *)holdCoinModel{
    GTHomeTitleModel * model0 = getItemModel(holdCoinModel.hoardpage_top100.alldatalist[0].datalist.firstObject)[self.indexPath.row-1];
   GTHomeTitleModel * model1 = getItemModel(holdCoinModel.hoardpage_top100.alldatalist[3].datalist.firstObject)[self.indexPath.row-1];
    GTHomeTitleModel * model2 = getItemModel(holdCoinModel.hoardpage_top100.alldatalist[2].datalist.firstObject)[self.indexPath.row-1];
    GTHomeTitleModel * model3 = getItemModel(holdCoinModel.hoardpage_top100.alldatalist[1].datalist.firstObject)[self.indexPath.row-1];
    GTHomeTitleModel * titleMode0 = holdCoinModel.hoardpage_top100.alldatalist[0].title;
    GTHomeTitleModel * titleModel1 = holdCoinModel.hoardpage_top100.alldatalist[3].title;
    GTHomeTitleModel * titleModel2 = holdCoinModel.hoardpage_top100.alldatalist[2].title;
    GTHomeTitleModel * titleModel3 = holdCoinModel.hoardpage_top100.alldatalist[1].title;
    
    if (self.indexPath.row == 0) {
        self.chibiLb.text = [NSString stringWithFormat:@"%@",titleMode0.content];
        self.chicangLb.text = [NSString stringWithFormat:@"%@",titleModel1.content];
        self.day7.text = [NSString stringWithFormat:@"%@",titleModel2.content];
        self.chackBt.text = [NSString stringWithFormat:@"%@",titleModel3.content];
        setStyle(titleMode0, self.chibiLb);
        setStyle(titleModel1, self.chicangLb);
        setStyle(titleModel2, self.day7);
        setStyle(titleModel3, self.chackBt);
    }else{
        self.chibiLb.text = [NSString stringWithFormat:@"%@",model0.content];
        self.chicangLb.text = [NSString stringWithFormat:@"%@",model1.content];
        self.day7.text = [NSString stringWithFormat:@"%0.2lf",[model2.content doubleValue]];
        self.chackBt.text = [NSString stringWithFormat:@"%@",model3.content];
        setStyle(model0, self.chibiLb);
        setStyle(model1, self.chicangLb);
        setStyle(model2, self.day7);
        setStyle(model3, self.chackBt);
       
        self.chackBt.textColor = gateColor(@"2c63d3");
    }
  @weakify(self)
    self.didPresentBlock = ^(NSString * _Nonnull str) {
    
        @strongify(self)
        
            EasyAlertView *alertView = [EasyAlertView alertViewWithTitle:@"地址" subtitle: self.chackBt.text AlertViewType:AlertViewTypeSystemAlert config:nil];
        
            [alertView addAlertItem:^EasyAlertItem *{
                return [EasyAlertItem itemWithTitle:@"复制" type:AlertItemTypeSystemDefault callback:^(EasyAlertView *showview, long index) {
                    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                    pasteboard.string = self.chicangLb.text;
                    [EasyTextView showText:@"复制成功" config:^EasyTextConfig *{
                        //（这三种方法都是一样的，根据使用习惯选择一种就行。|| 不传的参数就会使用EasyTextGlobalConfig全局配置的属性）
                        //方法一
                        //return [EasyTextConfig configWithSuperView:self.view superReceiveEvent:ShowTextEventUndefine animationType:TextAnimationTypeNone textStatusType:TextStatusTypeBottom];
                        //方法二
                        //return [EasyTextConfig shared].setBgColor([UIColor lightGrayColor]).setShadowColor([UIColor clearColor]).setStatusType(TextStatusTypeBottom);
                        //方法三
                        EasyTextConfig *config = [EasyTextConfig shared];
                        config.bgColor = [UIColor blackColor] ;
                        config.shadowColor = [UIColor clearColor] ;
                        config.animationType = TextAnimationTypeFade;
                        config.statusType = TextStatusTypeMidden ;
                        return config ;
                    }];
                }];
            }];
      
            [alertView addAlertItem:^EasyAlertItem *{
                return [EasyAlertItem itemWithTitle:@"取消" type:AlertItemTypeSystemCancel callback:nil];
            }];
            [alertView showAlertView];
    };
}
@end
