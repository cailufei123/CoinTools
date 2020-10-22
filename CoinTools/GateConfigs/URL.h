//
//  URL.h
//  HYDECarelink
//
//  Created by cailufei on 2018/11/27.
//  Copyright © 2018 liying. All rights reserved.
//

#ifndef URL_h
#define URL_h

//# 首页
#define homepagegURL [NSString stringWithFormat:@"%@/v1/data/homepage",basesURL]//首页



//# 多空
#define duokongURL [NSString stringWithFormat:@"%@/v1/data/ls",basesURL]//多空默认界面
#define v_coin_typeURL(v_coin_type) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/%@",basesURL,v_coin_type]//多空选币界面

#define v_coin_type_v_tsURL(v_coin_type,v_ts) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/%@/ts/%@",basesURL,v_coin_type,v_ts]
 
#define v_coin_type_v_pic_tsURL(v_coin_type,v_ts,v_pic_ts) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/%@/ts/%@/pic_ts/%@",basesURL,v_coin_type,v_ts,v_pic_ts]


//# 爆仓

#define baoCangURL [NSString stringWithFormat:@"%@/v1/data/burst",basesURL]//爆仓  选币界面
#define baocang_v_coin_typeURL(v_coin_type) [NSString stringWithFormat:@"%@/v1/data/burst/coin_type/%@",basesURL,v_coin_type]//爆仓  选时间界面
#define baocang_v_tsURL(v_coin_type,v_ts) [NSString stringWithFormat:@"%@/v1/data/burst/coin_type/%@/ts/%@",basesURL,v_coin_type,v_ts]//多空选币界面



//# 持仓

#define chiCongURL [NSString stringWithFormat:@"%@/v1/data/hold",basesURL]//持仓选币界面
#define chiCong_v_coin_typeURL(v_coin_type) [NSString stringWithFormat:@"%@/v1/data/hold/coin_type/%@",basesURL,v_coin_type]//持仓选时间界面
#define chiCong_v_tsURL(v_coin_type,v_ts) [NSString stringWithFormat:@"%@/v1/data/hold/coin_type/%@/ts/%@",basesURL,v_coin_type,v_ts]//多空选币界面


//#大单
#define bigdealURL [NSString stringWithFormat:@"%@/v1/data/bigdeal",basesURL]//大单默认界面
#define bigdeal_v_coin_typeURL(v_coin_type) [NSString stringWithFormat:@"%@/v1/data/bigdeal/coin_type/%@",basesURL,v_coin_type]//大单选币界面


#define bigdeal_v_tsURL(v_coin_type,v_ts) [NSString stringWithFormat:@"%@/v1/data/bigdeal/coin_type/%@/ts/%@",basesURL,v_coin_type,v_ts]//大单选时间界面



//# 恐慌指数

#define vixURL [NSString stringWithFormat:@"%@/v1/data/vix",basesURL]//恐慌指数默认界面
#define vix_v_tsURL(v_ts) [NSString stringWithFormat:@"%@/v1/data/vix/ts/%@",basesURL,v_ts]//恐慌指数选时间界面


#endif /* URL_h */

