//
//  URL.h
//  HYDECarelink
//
//  Created by cailufei on 2018/11/27.
//  Copyright © 2018 liying. All rights reserved.
//

#ifndef URL_h
#define URL_h
#define duokongURL [NSString stringWithFormat:@"%@/v1/data/ls",basesURL]//多空默认界面
#define v_coin_typeURL(v_coin_type) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/%@",basesURL,v_coin_type]//多空选币界面

#define v_coin_type_v_tsURL(v_coin_type,v_ts) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/%@/ts/%@",basesURL,v_coin_type,v_ts]
 
#define v_coin_type_v_pic_tsURL(v_coin_type,v_ts,v_pic_ts) [NSString stringWithFormat:@"%@/v1/data/ls/coin_type/<v_coin_type>/ts/<v_ts>/pic_ts/<v_pic_ts>",basesURL,v_coin_type,v_ts,v_pic_ts]


#endif /* URL_h */

