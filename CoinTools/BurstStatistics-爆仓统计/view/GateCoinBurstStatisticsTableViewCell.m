//
//  GateCoinBurstStatisticsTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateCoinBurstStatisticsTableViewCell.h"
#import "GateCoinBurstStatisticsSubCollectionViewCell.h"
@interface GateCoinBurstStatisticsTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@end
@implementation GateCoinBurstStatisticsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self collectionViewLyout];
    
    self.backgroundColor = [UIColor clearColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//             make.height.mas_equalTo(500);
//            [self.contentView layoutIfNeeded];
//        }];
        
       
        
    });
    return self;
}
-(void)setBcoin_coin_burst_total_info:(NSArray<GTBcoin_coin_burst_total_infoModel *> *)bcoin_coin_burst_total_info{
    _bcoin_coin_burst_total_info = bcoin_coin_burst_total_info;
    NSInteger totalPage = (bcoin_coin_burst_total_info.count + 3 - 1)/3;
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.height.mas_equalTo(totalPage * 100 +(totalPage-1)*10 + 10);
                [self.contentView layoutIfNeeded];
            }];
            
    [self.collectionView reloadData];
    
}
-(void)collectionViewLyout{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_offset(0);
         make.bottom.mas_offset(0);
    }];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
                      layout.minimumLineSpacing = 10;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-50)/3, 100);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateCoinBurstStatisticsSubCollectionViewCell");
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
       
        [self.contentView addSubview:_collectionView];
        
    }
    return _collectionView;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
   
    
}
#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.bcoin_coin_burst_total_info.count;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateCoinBurstStatisticsSubCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateCoinBurstStatisticsSubCollectionViewCell" forIndexPath:indexPath];
    GTBcoin_coin_burst_total_infoModel * bcoin_coin_burst_total_infoModel = self.bcoin_coin_burst_total_info[indexPath.row];
    cell.nameLb.text = bcoin_coin_burst_total_infoModel.coin_type;
    cell.moneyLb.text = [NSString stringWithFormat:@"%0.2lf万",[bcoin_coin_burst_total_infoModel.burst_amt doubleValue]/10000]  ;
    cell.matchMoneyLb.text =  [NSString stringWithFormat:@"≈%@个%@",bcoin_coin_burst_total_infoModel.equivalent_amt,bcoin_coin_burst_total_infoModel.coin_type];
    
    if ([bcoin_coin_burst_total_infoModel.equivalent_amt integerValue]>10000) {
         cell.matchMoneyLb.text =  [NSString stringWithFormat:@"≈%ld万个%@",[bcoin_coin_burst_total_infoModel.equivalent_amt integerValue]/10000,bcoin_coin_burst_total_infoModel.coin_type];
    }
    
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end
