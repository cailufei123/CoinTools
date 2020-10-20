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
-(void)setBurstcoin:(GTPublicContentModel *)burstcoin{
    _burstcoin = burstcoin;
//    totalPage = (total + pagesize -1) / pagesize;
    NSArray * models =  [GTDataManager getItemModelWhit:burstcoin.alldatalist.firstObject.datalist.firstObject];
    NSInteger totalPage = (models.count + 3 - 1)/3;
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.height.mas_equalTo(totalPage * 80 +(totalPage-1)*10+3);
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
                      layout.itemSize = CGSizeMake((scrWeiht-50)/3, 80);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateCoinBurstStatisticsSubCollectionViewCell");
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
       
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
    return self.burstcoin.alldatalist.firstObject.datalist.firstObject.count;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateCoinBurstStatisticsSubCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateCoinBurstStatisticsSubCollectionViewCell" forIndexPath:indexPath];
    GTHomeTitleModel * homeTitleModel1 =  [GTDataManager getItemModelWhit:_burstcoin.alldatalist[0].datalist.firstObject][indexPath.item];
    GTHomeTitleModel * homeTitleModel2 =  [GTDataManager getItemModelWhit:_burstcoin.alldatalist[1].datalist.firstObject][indexPath.item];
    GTHomeTitleModel * homeTitleModel3 =  [GTDataManager getItemModelWhit:_burstcoin.alldatalist[2].datalist.firstObject][indexPath.item];
    
    cell.nameLb.text = homeTitleModel1.content;
    [GTStyleManager setStyleWhit:homeTitleModel1 forLale:cell.nameLb];
  
    [GTStyleManager setStyleWhit:homeTitleModel2 forLale:cell.moneyLb];
    cell.matchMoneyLb.text = [NSString stringWithFormat:@"≈%@%@%@",homeTitleModel3.content,[GTDataManager getLanguageData:@"ge"], homeTitleModel1.content];
    [GTStyleManager setStyleWhit:homeTitleModel3 forLale:cell.matchMoneyLb];
    

    if ([homeTitleModel2.content integerValue]>10000) {
        
        cell.moneyLb.text = [NSString stringWithFormat:@"$%0.2lf%@",[homeTitleModel2.content doubleValue]/10000,[GTDataManager getLanguageData:@"wan"]];
    }else{
        cell.moneyLb.text = [NSString stringWithFormat:@"$%0.2lf",[homeTitleModel2.content doubleValue]/10000];
      
    }
    
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end
