//
//  UIViewController+HYDENavigation.m
//  HYDE114Health
//
//  Created by 李莹 on 2018/4/2.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIViewController+HYDENavigation.h"
#import "NSString+HYDESize.h"
#import "UIFont+HYDENormalFont.h"
#import <UIColor+YYAdd.h>
#import <objc/runtime.h>

static const void *popIndexKey = &popIndexKey;

@implementation UIViewController (HYDENavigation)

@dynamic navTitle;

- (void)setPopIndex:(NSInteger)popIndex{
    NSString * index = [NSString stringWithFormat:@"%ld",(long)popIndex];
    objc_setAssociatedObject(self, popIndexKey, index, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)popIndex{
    return [objc_getAssociatedObject(self, popIndexKey) integerValue];
}

- (void)setNavTitle:(NSString *)navTitle{
    [self setNavTitle:navTitle withColor:@"ffffff"];
}

- (void)setNavTitle:(NSString *)navTitle withColor:(NSString *)hexColor{
    if ([navTitle isNotBlank]) {
//        self.navigationController.navigationBar.translucent = NO;
        self.navigationItem.titleView = [self navTitle:navTitle withColor:hexColor];
    }
}

- (UIButton *)setNavLeftItems:(NSArray *)items selectIndex:(NSInteger)index{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    UIButton * leftButton;
    int i = 0;
    for (NSDictionary *item in items) {
        UIButton * button = [self rightItemTitle:item[@"title"] imageName:item[@"image"] withAction:item[@"action"]];
        button.frame = CGRectMake(i*40, 0, 40, 44);
        button.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        [view addSubview:button];
        if (i == index) {
            leftButton = button;
        }
        i++;
    };
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacerItem.width = -10;
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.leftBarButtonItems =  @[spacerItem,item];
    
    return leftButton;
}


- (UIButton *)setNavLeftItemTitle:(NSString *)title ImageName:(NSString *)imageName WithAction:(NSString *)action{
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    spacerItem.width = -10;
    
    UIButton *btn = [self leftItemTitle:title imageName:imageName withAction:action];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItems =  @[spacerItem,item];
    
    return btn;
}


- (UIButton *)xsetNavRightItemTitle:(NSString *)title ImageName:(NSString *) imageName WithAction:(NSString *)action{
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    spacerItem.width = -10;
    
    UIButton* button = [self rightItemTitle:title imageName:imageName withAction:action];
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItems =  @[spacerItem,item];
     button.adjustsImageWhenHighlighted = NO;
    return button;
}

- (UIButton *)setNavRightItems:(NSArray *)items selectIndex:(NSInteger)index{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    UIButton * rightButton;
    int i = 0;
    for (NSDictionary *item in items) {
        UIButton * button = [self rightItemTitle:item[@"title"] imageName:item[@"image"] withAction:item[@"action"]];
        button.frame = CGRectMake(i*40+5, 0, 40, 44);
        button.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [view addSubview:button];
        if (i == index) {
            rightButton = button;
        }
        i++;
    };
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItems =  @[item];
    
    return rightButton;
}

- (UIButton *)setRigtItemTitle:(NSString *)title ImageName:(NSString *) imageName WithAction:(NSString *)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title && imageName) {
        btn.frame =CGRectMake(0, 0, 94, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:15.0 WithFontType:Normal];
        
        [btn setTitleColor:[UIColor colorWithHexString:hydeColorBlue] forState:UIControlStateNormal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(!title && imageName){
        btn.frame =CGRectMake(0, 0, 44, 44);
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,5 *scrHeiht /375.0)];
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(title && !imageName){
        
        float width ;
        if (self.navigationItem.titleView) {
            width = ([[UIScreen mainScreen] bounds].size.width - CGRectGetWidth(self.navigationItem.titleView.frame))/2-16;
        }
        else
            width = 84;
        btn.frame =CGRectMake(0, 0, width, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:hydeColorBlue] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:15.0 WithFontType:Normal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
    }
    
    [btn addTarget: self action: NSSelectorFromString(action) forControlEvents: UIControlEventTouchUpInside];
    
    return btn;
}

- (void)setNavBottomLine:(NSString *)color{
    if (![color isNotBlank]) {
//        color = hydeColorf5f;
    }
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    if (navBarHairlineImageView) {
        //        navBarHairlineImageView.hidden = YES;
        UIImageView *navLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(navBarHairlineImageView.bounds), 0.6)];
        navLine.backgroundColor = [UIColor colorWithHexString:color];
        [navBarHairlineImageView addSubview:navLine];
    }
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark -


- (UIButton *)leftItemTitle:(NSString *)title imageName:(NSString *)imageName withAction:(NSString *)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title && imageName) {
        btn.frame =CGRectMake(0, 0, 86+(ScreenWidth > 375 ? 10 : 5), 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:hydeColorBlue] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:14.0 WithFontType:Normal];
        
        btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0,10,0,0)];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(!title && imageName){
        btn.frame =CGRectMake(0, 0, 44, 44);
        
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,5 * ScreenWidth /375.0,0,0)];
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(title && !imageName){
        btn.frame =CGRectMake(0, 0, 84, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:15.0 WithFontType:Normal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    
    [btn addTarget: self action: NSSelectorFromString(action) forControlEvents: UIControlEventTouchUpInside];
    return btn;
}

- (UIButton *)rightItemTitle:(NSString *)title imageName:(NSString *)imageName withAction:(NSString *)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title && imageName) {
        btn.frame =CGRectMake(0, 0, 94, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:15.0 WithFontType:Normal];
        
        [btn setTitleColor:[UIColor colorWithHexString:hydeColorBlue] forState:UIControlStateNormal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(!title && imageName){
        btn.frame =CGRectMake(0, 0, 44, 44);
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,5 *ScreenWidth /375.0-5)];
        [btn setImage:[UIImage imageNamed:imageName]  forState:UIControlStateNormal];
    }
    else if(title && !imageName){
        
        float width ;
        if (self.navigationItem.titleView) {
            width = ([[UIScreen mainScreen] bounds].size.width - CGRectGetWidth(self.navigationItem.titleView.frame))/2-16;
        }
        else
            width = 84;
        btn.frame =CGRectMake(0, 0, width, 44);
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:hydeColorBlue] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont normalFontOfSize:15.0 WithFontType:Normal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
    }
    
    [btn addTarget: self action: NSSelectorFromString(action) forControlEvents: UIControlEventTouchUpInside];
    
    return btn;
}

- (UILabel *)navTitle:(NSString *)navTitle withColor:(NSString *)hexColor{
    float width = [navTitle getTheSizeWidthWithFont:[UIFont normalFontOfSize:18.0 WithFontType:Normal] WithHeight:44];
    if (width>160) {
        width = 160;
    }
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    
    titleLabel.text = navTitle;
    
    titleLabel.textColor = [UIColor colorWithHexString:hexColor];
    
    titleLabel.font = [UIFont normalFontOfSize:18.0 WithFontType:Medium];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return titleLabel;
}

- (void)setTitleViewWith:(NSArray *)leftItems withRightItem:(NSArray *)rightItems withTitle:(UILabel *)titleLable{
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-16, 44)];
    CGFloat width = 0;
    for (UIView *leftBtn in leftItems) {
        CGRect rect = leftBtn.frame;
        leftBtn.frame = CGRectMake(width, 0, CGRectGetWidth(rect), CGRectGetHeight(rect));
        width += CGRectGetWidth(rect);
        [titleView addSubview:leftBtn];
    }
    width = CGRectGetWidth(titleView.frame);
    for (UIView *rightBtn in rightItems) {
        CGRect rect = rightBtn.frame;
        width -= CGRectGetWidth(rect);
        rightBtn.frame = CGRectMake(width, 0, CGRectGetWidth(rect), CGRectGetHeight(rect));
        [titleView addSubview:rightBtn];
    }
    if (titleLable) {
        titleLable.center = titleView.center;
        [titleView addSubview:titleLable];
    }
    self.navigationItem.titleView = titleView;
}


@end
