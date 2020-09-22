//
//  GTMenuSelectView.m
//  CoinTools
//
//  Created by MAC on 2020/9/18.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTMenuSelectView.h"
#import "GTMenuSelectViewCollectionViewCell.h"
@interface GTMenuSelectView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSIndexPath * selectIndexPath;

@end
@implementation GTMenuSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self collectionViewLyout];
        [self closeButton];
       
       
    }
    return self;
}

-(UIButton *)closeButton{
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width-40, 0, 40, 40)];
        [_closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton setImage:getImage(@"add_14x14_@3x") forState:UIControlStateNormal];
        [self addSubview:_closeButton];
      
    }
    return _closeButton;
}
-(void)closeAction:(UIButton *)btn{
  [self didSelectItemAtIndexPath:0 isColse:YES];
}
-(void)setArr:(NSArray *)arr{
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(335);
//        arr.count * 80 + (arr.count -1) *  10
           }];
}
-(void)collectionViewLyout{
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.top.mas_offset(40);
//         make.bottom.mas_offset(0);
//    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_offset(40);
         make.bottom.mas_offset(0);
    }];
//    self.collectionView.frame = self.bounds;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
                      layout.minimumLineSpacing = 10;
                      layout.minimumInteritemSpacing =0;
//                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-50)/3, 30);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = gateColor(@"ffffff");
           gateCollectionRegisterClass(_collectionView, @"GTMenuSelectViewCollectionViewCell");
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
       
       //注册头尾试图
//             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [self addSubview:_collectionView];
        
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
    return self.titles.count;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GTMenuSelectViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTMenuSelectViewCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = gateColor(@"f8fbfb");
    cell.titleLb.text = self.titles[indexPath.row];
    if (self.selectIndexPath == indexPath) {
        cell.titleLb.textColor = gateColor(@"315dda");
    }else{
         cell.titleLb.textColor = gateColor(@"000309");
    }
  
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    !_selectBlockItme?:_selectBlockItme(indexPath.item,NO);
    [self didSelectItemAtIndexPath:indexPath.item isColse:NO];
      self.selectIndexPath = indexPath;
    [collectionView reloadData];
    
}
-(void)didSelectItemAtIndexPath:(NSInteger)index isColse:(BOOL)isColse{
      !_selectBlockItme?:_selectBlockItme(index,isColse);
    [UIView animateWithDuration:0.3f animations:^{
   self.closeButton.transform = CGAffineTransformIdentity;
  }];
   
}
-(void)selectUICollectionViewitem:(NSInteger)index{
    self.selectIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
//    [self collectionView:self.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    [ self.collectionView reloadData];
}
-(void)setTitles:(NSArray *)titles{
    
    _titles = titles;
    [self.collectionView reloadData];
    
}
@end
