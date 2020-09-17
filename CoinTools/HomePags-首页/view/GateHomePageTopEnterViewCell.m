//
//  GateHomePageTopEnterViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateHomePageTopEnterViewCell.h"
#import "GateHomePageTopEnterViewCollectionViewCell.h"
#import "GTNewTopDuiBiCollectionViewCell.h"
@interface GateHomePageTopEnterViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)UIView * topView;
@end
@implementation GateHomePageTopEnterViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        UILabel * lb = [[UILabel alloc] init];
        lb.textAlignment = NSTextAlignmentLeft;
        lb.text = @"BTC报价";lb.textColor = gateColor(@"333B46");
        lb.font= gateFont(16, Medium);
        
         [self.contentView addSubview:_topView];
        [_topView addSubview:lb];
       
         [lb mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.mas_equalTo(15);
             make.right.mas_equalTo(0);
             make.top.mas_offset(0);
              make.bottom.mas_offset(0);
         }];
    }
    return _topView;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     self.selectionStyle = UITableViewCellSelectionStyleNone;
     [self collectionViewLyout];
    
    return self;
}
-(void)setArr:(NSArray *)arr{
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(335);
//        arr.count * 80 + (arr.count -1) *  10
           }];
}
-(void)collectionViewLyout{
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.top.mas_offset(0);
        
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(144+74);
        make.top.mas_equalTo(self.topView.mas_bottom).offset(0);
         make.bottom.mas_offset(0);
    }];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
                      layout.minimumLineSpacing = 2;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-36)/4, 71);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateHomePageTopEnterViewCollectionViewCell");
          gateCollectionRegisterNib(_collectionView, @"GTNewTopDuiBiCollectionViewCell");
        
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
       
       //注册头尾试图
             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [self.contentView addSubview:_collectionView];
        
    }
    return _collectionView;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
   
    
}

#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
         return 8;
    }
    return 4;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
             GateHomePageTopEnterViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateHomePageTopEnterViewCollectionViewCell" forIndexPath:indexPath];
               cell.titleLb.text = @"爆仓数据";
               cell.moneyLb.text = @"1H $3457万";
               cell.twentyFourHourNumberLb.text = @"24H $357万";
               return cell;
    }else{
        GTNewTopDuiBiCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTNewTopDuiBiCollectionViewCell" forIndexPath:indexPath];
           cell.titleLb.text = @"实盘多空人数";
          cell.duibiLb.text = @"多45%:空63%";
          return cell;
    }
      
   
  
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    !_selectBlock?:_selectBlock(indexPath.item);
}



@end
