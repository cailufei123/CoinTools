//
//  GTHeYueMessageTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/10/13.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTHeYueMessageTableViewCell.h"
#import "GTHeYueMessageCollectionViewCell.h"
@interface GTHeYueMessageTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)UILabel * messageLb;
@end
@implementation GTHeYueMessageTableViewCell

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
-(UILabel *)messageLb{
    if(!_messageLb){
        _messageLb = [[UILabel alloc] init];
        [self.contentView addSubview:_messageLb];
        _messageLb.textAlignment  = NSTextAlignmentRight;
        _messageLb .text = @"3333333";
    }
    return _messageLb;
}
-(void)collectionViewLyout{
    [self.messageLb mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(0);
           make.right.mas_equalTo(-15);
           make.height.mas_equalTo(40);
           make.bottom.mas_offset(0);
       }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_offset(0);
         make.bottom.mas_equalTo(self.messageLb.mas_top).offset(0);
    }];
    
  
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
                      layout.minimumLineSpacing = 10;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
                      layout.itemSize = CGSizeMake((scrWeiht-60)/3, 50);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GTHeYueMessageCollectionViewCell");
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
    return 6;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GTHeYueMessageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTHeYueMessageCollectionViewCell" forIndexPath:indexPath];
   
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end
