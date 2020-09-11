//
//  GateHomePageTopEnterViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateHomePageTopEnterViewCell.h"
#import "GateHomePageTopEnterViewCollectionViewCell.h"
@interface GateHomePageTopEnterViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@end
@implementation GateHomePageTopEnterViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
//        make.height.mas_equalTo(50);
        make.top.mas_offset(0);
         make.bottom.mas_offset(0);
    }];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
                      layout.minimumLineSpacing = 10;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-50)/3, 100);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateHomePageTopEnterViewCollectionViewCell");
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
    return 1;
   
    
}

#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateHomePageTopEnterViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateHomePageTopEnterViewCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    !_selectBlock?:_selectBlock(indexPath.item);
}



@end
