//
//  GateWholeNetworkBigOrderStatisticsCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateWholeNetworkBigOrderStatisticsCell.h"
#import "GateWholeNetworkBigOrderStatisticsCollectionCell.h"

@interface GateWholeNetworkBigOrderStatisticsCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@end
@implementation GateWholeNetworkBigOrderStatisticsCell
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
                      layout.itemSize = CGSizeMake((scrWeiht-40)/2, 120);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateWholeNetworkBigOrderStatisticsCollectionCell");
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
    return 2;
    
}
#pragma mark - collectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.width, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header"forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor whiteColor];
       
        YYLabel *title = [[YYLabel alloc] initWithFrame:CGRectMake(15, 10, self.width, 30)];
        title.text = indexPath.section == 0 ? @"合约" :@"现货";
        title.textColor = gateColor(@"283864");
        title.font = gateFont(13, Medium);
        [headerView addSubview:title];
        return headerView;
    }
      return nil;
}

#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateWholeNetworkBigOrderStatisticsCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateWholeNetworkBigOrderStatisticsCollectionCell" forIndexPath:indexPath];
    if (indexPath.section == 0 ) {
        cell.borderColor  = gateColor(@"fee0c5");
        cell.titleBgView.backgroundColor = gateColor(@"fecda8");
        cell.borderWidth = 1;
    }else{
        cell.titleBgView.backgroundColor =  gateColor(@"adb7ff");
          cell.borderWidth = 1;
        cell.borderColor  = gateColor(@"c9cfff");
    }
    
//    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//         make.height.mas_equalTo( collectionView.contentSize.height);
//    }];
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}



@end
