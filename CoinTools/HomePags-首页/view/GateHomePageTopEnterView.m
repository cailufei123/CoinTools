//
//  GateHomePageTopEnterView.m
//  CoinTools
//
//  Created by MAC on 2020/9/11.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GateHomePageTopEnterView.h"
#import "GateHomePageTopEnterViewCollectionViewCell.h"
@interface GateHomePageTopEnterView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@end
@implementation GateHomePageTopEnterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          [self collectionViewLyout];
    }
    return self;
}
-(void)collectionViewLyout{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
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
           gateCollectionRegisterNib(_collectionView, @"GateHomePageTopEnterViewCollectionViewCell");
           _collectionView.delegate = self;
          _collectionView.dataSource = self;
       
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
    return 6;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateHomePageTopEnterViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateHomePageTopEnterViewCollectionViewCell" forIndexPath:indexPath];
   
//    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//         make.height.mas_equalTo( collectionView.contentSize.height);
//    }];
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}


@end
