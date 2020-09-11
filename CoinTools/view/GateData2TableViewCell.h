//
//  GateData2TableViewCell.h
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GateHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GateData2TableViewCell : UITableViewCell
@property(nonatomic,strong)GateBurst_dtlModel * burst_dtl;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@end

NS_ASSUME_NONNULL_END
