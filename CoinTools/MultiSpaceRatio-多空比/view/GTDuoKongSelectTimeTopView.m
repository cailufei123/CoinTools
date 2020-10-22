//
//  GTDuoKongSelectTimeTopView.m
//  CoinTools
//
//  Created by MAC on 2020/10/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTDuoKongSelectTimeTopView.h"
#import "GTGTDuoKongSelectTimeTopViewCollectionViewCell.h"
@interface GTDuoKongSelectTimeTopView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSIndexPath * selectIndexPath;
@property(nonatomic,strong)NSArray * imgs;
@property(nonatomic,strong)NSArray * titles;

@end
@implementation GTDuoKongSelectTimeTopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_selectIndexPath) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
            _selectIndexPath = indexPath;
        }
//       self.imgs = [NSArray arrayWithObjects:@"zhadan@3x-2",@"RectangleCopy@3x" ,@"icon_huabanfuben@3x" ,@"jingjiren_chengjiaoguanli@3x" ,@"shujuzhongxinshujucangku@3x" ,nil];
       self.titles = [NSArray arrayWithObjects:@"4小时多空(通用)",@"1小时多空", @"5分钟多空", nil];
        [self collectionViewLyout];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.collectionView reloadData];
//            [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]  animated:YES scrollPosition:UICollectionViewScrollPositionNone];
//            [self collectionView:self.collectionView didSelectItemAtIndexPath:self.selectIndexPath];
//
////            [self.collectionView selectItemAtIndexPath:self.selectIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
//        });

    }
    return self;
}

-(void)setArr:(NSArray *)arr{
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(335);
//        arr.count * 80 + (arr.count -1) *  10
           }];
}
//-(void)setHomepage_navigation:(GTHomepage_navigationModel *)homepage_navigation{
//    _homepage_navigation = homepage_navigation;
//    [self.collectionView reloadData];
//
//}
-(void)collectionViewLyout{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
        make.top.mas_offset(0);
         make.bottom.mas_offset(0);
    }];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//                      layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
                      layout.minimumLineSpacing = 0;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht)/3, 50);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = gateColor(@"f5f5f5");
           gateCollectionRegisterNib(_collectionView, @"GTGTDuoKongSelectTimeTopViewCollectionViewCell");
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
       
       //注册头尾试图
             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
             [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
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
    return  self.titles .count;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GTGTDuoKongSelectTimeTopViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTGTDuoKongSelectTimeTopViewCollectionViewCell" forIndexPath:indexPath];

    if (self.selectIndexPath == indexPath) {
        cell.selectImageView.image = getImage(@"select_s-1_20x20_@2x");
    }else{
        cell.selectImageView.image = getImage(@"select_u_20x20_@2x");
    }
    cell.titleLb.text = self.titles[indexPath.row];
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    !_selectblock?:_selectblock(indexPath.item);
    self.selectIndexPath = indexPath;
    [self.collectionView reloadData];
}



@end
