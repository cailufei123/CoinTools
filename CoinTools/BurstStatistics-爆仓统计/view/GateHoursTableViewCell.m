//
//  GateHoursTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/31.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHoursTableViewCell.h"
#import "GateHoursCollectionViewCell.h"
@implementation GateHoursTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   [self setCollectionView];
    
    
    
    
    NSString * allStr = @"最近24小时，共有6014币民爆仓";
    NSMutableAttributedString * allAttributedString =[allStr getMutableAttributedStringWhitSearchString:@"6014" searchStringColor:gateColor(@"5461d4") searchStringFont:gateFont(14, Normal)];
    self.messageLB.attributedText =  allAttributedString;
}


-(void)setCollectionView{
    
     UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
               layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
               layout.minimumLineSpacing = 10;
               layout.minimumInteritemSpacing =0;
               layout.scrollDirection = UICollectionViewScrollDirectionVertical;
               layout.itemSize = CGSizeMake((scrWeiht-40)/2 , 120);
               [ self.collectionView setCollectionViewLayout:layout];
               self.collectionView.backgroundColor = [UIColor whiteColor];
    gateCollectionRegisterNib(self.collectionView, @"GateHoursCollectionViewCell");
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 15, 0, 15);
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
   
    
}
#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateHoursCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateHoursCollectionViewCell" forIndexPath:indexPath];
   
    cell.titleView.backgroundColor = indexPath.row ==0 ? gateBackgroundOrangeColor: gateBackgroundBlueColor;
    cell.bagView.layer.borderColor = indexPath.row ==0 ? gateColor(@"f6d3c8").CGColor:  gateColor(@"c1c6ee").CGColor;
  
  
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

@end

