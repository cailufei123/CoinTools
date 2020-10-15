//
//  GTNewTopTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTNewTopTableViewCell.h"
#import "GTNewTopCollectionViewCell.h"
@interface GTNewTopTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSArray * imgs;
@property(nonatomic,strong)NSArray * titles;
@end
@implementation GTNewTopTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.imgs = [NSArray arrayWithObjects:@"zhadan@3x-2",@"RectangleCopy@3x" ,@"icon_huabanfuben@3x" ,@"jingjiren_chengjiaoguanli@3x" ,@"shujuzhongxinshujucangku@3x" ,nil];
    self.titles = [NSArray arrayWithObjects:@"爆仓数据",@"合约持仓", @"多空比", @"大单成交", @"持币", nil];
     [self collectionViewLyout];
   
    return self;
}
-(void)setArr:(NSArray *)arr{
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(335);
//        arr.count * 80 + (arr.count -1) *  10
           }];
}
-(void)setHomepage_navigation:(GTHomepage_navigationModel *)homepage_navigation{
    _homepage_navigation = homepage_navigation;
    [self.collectionView reloadData];
    
}
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
                      layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
                      layout.minimumLineSpacing = 10;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-50)/5, 60);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = gateColor(@"f5f5f5");
           gateCollectionRegisterNib(_collectionView, @"GTNewTopCollectionViewCell");
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
    return self.homepage_navigation.alldatalist.firstObject.datalist.firstObject.count;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GTNewTopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTNewTopCollectionViewCell" forIndexPath:indexPath];
    NSString * iamgename = [NSString stringWithFormat:@"homeImages/%@",self.imgs[indexPath.row]];
    GTHomeTitleModel * homeTitleModel = [GTDataManager getItemModelWhit:self.homepage_navigation.alldatalist.firstObject.datalist.firstObject] [indexPath.row];
    [cell.titleImageView setImageWithURL:urlWhitString(homeTitleModel.url) placeholder:getImage(iamgename)] ;
//    [NSString stringWithFormat:@"homeImages/%@",self.imgs[indexPath.row]]
     cell.titleText = homeTitleModel.content;
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    !_selectBlock?:_selectBlock(indexPath.item);
}



@end
