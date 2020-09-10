//
//  UITableViewCell+GateTableViewCell.m
//  block-pro
//
//  Created by 蔡路飞 on 2020/8/29.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "UITableViewCell+GateTableViewCell.h"

@implementation UITableViewCell (GateTableViewCell)
-(void)awakeFromNib{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
@end
