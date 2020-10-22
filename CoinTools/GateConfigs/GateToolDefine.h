//
//  GateToolDefine.h
//  block-pro
//
//  Created by 蔡路飞 on 2020/8/29.
//  Copyright © 2020 MAC. All rights reserved.
//

#ifndef GateToolDefine_h
#define GateToolDefine_h

#define gateColor(hex) [UIColor colorWithHexString:hex]

#define gateFont(fontSize,fontType) [UIFont normalFontOfSize:fontSize WithFontType:fontType]

#define hydeNormalHospitalImage [UIImage imageNamed:@"hospitalDefault"]

#define hydeNormalDoctorImage [UIImage imageNamed:@"doctorDefault"]

#define hydeNormalUserImage [UIImage imageNamed:@"hospitalDefault"]

#define hydeBannerImageSize CGSizeMake(ScreenWidth , (ScreenWidth - 30) * 110 / 345)

#define getImage(hex) [UIImage imageNamed:[NSString stringWithFormat:@"CoinTools.framework/GateScources.bundle/%@",hex]]

#define getImageName(hex) [NSString stringWithFormat:@"CoinTools.framework/GateScources.bundle/%@",hex]

#define getPlaceholderImage [UIImage imageNamed:[NSString stringWithFormat:@"CoinTools.framework/GateScources.bundle/%@",@"ic_image_night_32x32_@3x"]]

#define gateTableRegisterNib(tableView,nibName) [tableView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"CoinTools.framework/%@",nibName] bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibName]

#define gateTableRegisterClass(tableView,className) [tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className]


#define gateCollectionRegisterNib(collectionView,nibName) [collectionView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"CoinTools.framework/%@",nibName] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:nibName]

#define gateCollectionRegisterClass(collectionView,className) [collectionView registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className]


#define urlWhitString(url) [NSURL URLWithString:url]


#define loadXib [[[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"CoinTools.framework/%@",NSStringFromClass([self class])] owner:nil options:nil] firstObject];


#define getItemModel(hex)  [GTDataManager getItemModelWhit:hex]
#define setStyle(hex,lable)  [GTStyleManager setStyleWhit:hex forLale:lable];
#define getLanguage(hex)  [GTDataManager getLanguageData:hex]

//#ifndef __OPTIMIZE__
//    //这里执行的是debug模式下，打印日志，当前行
//    #define GTLog(...) printf("%s %s 第%d行: %s\n",__TIME__, __PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
//#else
//        //这里执行的是release模式下，不打印日志
//    #define NSLog(...)
//#endif


#ifdef DEBUG
#define GTLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif


//定义状态栏高度
//定义状态栏高度
#define kStatusBarHeight \
^(){\
 if (@available(iOS 13.0, *)) {\
     UIStatusBarManager *statusBarManager = [[[UIApplication sharedApplication] windows] objectAtIndex:0].windowScene.statusBarManager;\
     return statusBarManager.statusBarFrame.size.height;\
 }else{\
     return [[UIApplication sharedApplication] statusBarFrame].size.height;\
 }\
}()



//#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define KTBHeight           (kTopHeight+kTabBarHeight)   //tabbar+nav总高度
#define LFNSNOTI [NSNotificationCenter defaultCenter]


#define IS_IPHONE_X (@available(iOS 11.0, *) ? [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )

#define NaviBarHeight (IS_IPHONE_X ? 88.0f : 64.0f)
#define TabBarHeight (IS_IPHONE_X ? 83.0f : 49.0f)


#define gateSelectTextHeight(text) [text getTheSizeWidthWithFont:gateFont(14, Normal) WithHeight:20]+30
#endif /* GateToolDefine_h */
