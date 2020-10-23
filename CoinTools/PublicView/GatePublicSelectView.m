//
//  GatePublicSelectView.m
//  block-pro
//
//  Created by MAC on 2020/9/3.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GatePublicSelectView.h"
#import "GateSelectLineChartCollectionViewCell.h"
//#import "GatePublicSelectModel.h"
#import "NSString+HYDESize.h"
#define cornerRi 6
@interface GatePublicSelectView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSIndexPath * selectIndexPath;
@property(nonatomic,assign)CGFloat collectionWight;
@end
@implementation GatePublicSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionViewLyout];
    }
    return self;
}
-(void)setArr:(NSMutableArray *)arr{
    _arr = arr;
    if (arr.count>0) {
        
        CGFloat collectionWight = 0;
        for (GatePublicSelectModel *publicSelectModel in arr) {
           
            collectionWight += (gateSelectTextHeight(publicSelectModel.titleText));
        }
        self.collectionWight = collectionWight>scrWeiht?collectionWight-10:collectionWight;
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(collectionWight+10>scrHeiht?scrHeiht-10:collectionWight+10);
        }];
    }
   
    [self.collectionView reloadData];
}
-(void)collectionViewLyout{
  
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(160);
        make.top.mas_offset(0);
         make.bottom.mas_offset(0);
    }];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
      
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                      layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
                      layout.minimumLineSpacing = 0;
                      layout.minimumInteritemSpacing =0;
                      layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        layout.itemSize = CGSizeMake((self.width-50)/3, self.height);
//                      [_collectionView setCollectionViewLayout:layout];
          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
                      _collectionView.backgroundColor = [UIColor whiteColor];
           gateCollectionRegisterNib(_collectionView, @"GateSelectLineChartCollectionViewCell");
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
    
    return self.arr.count;
    
}
-(void)setSelectIndex:(NSInteger)selectIndex{
 
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:selectIndex inSection:0];
    [self.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:NO];
    self.selectIndexPath = indexPath;
     [self.collectionView reloadData];
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateSelectLineChartCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateSelectLineChartCollectionViewCell" forIndexPath:indexPath];
    GatePublicSelectModel *  selectModel = self.arr[indexPath.row];
    cell.innerView.cornerRadius = cornerRi-2;
    cell.nameLb.text = selectModel.titleText.length? selectModel.titleText:@"BTC交易";
    if (self.checkboxEnabled) {
         [self circularStyle:cell publicSelectModel:selectModel defaultStyle: selectModel.selectEnabled ?YES:NO];
       
    }else{
        if (self.selectIndexPath == indexPath) {
            selectModel.selectEnabled = YES;
            [self singleChoicecircularStyle:cell publicSelectModel:selectModel defaultStyle:NO];
            
        }else{
            selectModel.selectEnabled = NO;
             [self singleChoicecircularStyle:cell publicSelectModel:selectModel defaultStyle:YES];
        }
    }
    
    
  
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
     

     GatePublicSelectModel *  selectModel = self.arr[indexPath.row];
   if (selectModel.selectEnabled) {
           selectModel.selectEnabled = NO;
       }else{
           selectModel.selectEnabled = YES;
        
     }
    if (!self.checkboxEnabled) {
        
        self.selectIndexPath = indexPath;
        
        
    }
    
    !_selectBlock?:_selectBlock(indexPath.row,selectModel);
 
    [self.collectionView reloadData];
}

-(void)singleChoicecircularStyle:(GateSelectLineChartCollectionViewCell * )cell publicSelectModel:(GatePublicSelectModel *)selectModel defaultStyle:(BOOL)isDefault{
      cell.selectBt.borderColor = selectModel.color;
            if (isDefault) {
                     cell.innerView.hidden = YES;
                     cell.nameLb.textColor = selectModel.selectColor;
                     cell.selectBt.borderWidth = 1;
                 }else{
                      cell.innerView.backgroundColor = selectModel.color;
                     cell.innerView.hidden = NO;
                     cell.selectBt.borderWidth = 1;
                     cell.nameLb.textColor = selectModel.titlesColor;
                    
            }
    
}
    

 

-(void)circularStyle:(GateSelectLineChartCollectionViewCell * )cell publicSelectModel:(GatePublicSelectModel *)selectModel defaultStyle:(BOOL)isDefault{
       
   
    
    if (selectModel.shape == circular &&  self.specialCircularEnabled != YES) {
         cell.selectBt.cornerRadius = cornerRi;
         cell.selectBt.masksToBounds = NO;
         cell.selectBt.backgroundColor = [UIColor whiteColor];
         if (isDefault) {
             
               cell.innerView.hidden = NO;
               cell.selectBt.borderColor = selectModel.selectColor;
               cell.nameLb.textColor = selectModel.selectColor;
               cell.selectBt.borderWidth = 1;
               cell.innerView.backgroundColor = selectModel.selectColor;
              
           }else{
               
               cell.innerView.hidden = NO;
               cell.selectBt.borderColor = selectModel.color;
               cell.selectBt.borderWidth = 1;
               cell.nameLb.textColor = selectModel.titlesColor;
               cell.innerView.backgroundColor = selectModel.color;
                
           }
           
    }else  if (selectModel.shape == specialCircular || self.specialCircularEnabled == YES) {
       
        cell.innerView.hidden = YES;
               cell.selectBt.cornerRadius = cornerRi;
         cell.selectBt.borderWidth = 0;
               if (isDefault) {
                   cell.nameLb.textColor = selectModel.selectColor;
                    cell.selectBt.backgroundColor =  selectModel.selectColor;
                 
               }else{
                   
                   cell.nameLb.textColor = selectModel.titlesColor;
                   cell.selectBt.backgroundColor =  selectModel.color;
                 
            }
        
        
    }else{
         cell.innerView.hidden = YES;
         cell.selectBt.cornerRadius = 0;
         cell.selectBt.borderWidth = 0;
        if (isDefault) {
            cell.nameLb.textColor = selectModel.selectColor;
             cell.selectBt.backgroundColor =  selectModel.selectColor;
          
        }else{
            
            cell.nameLb.textColor = selectModel.titlesColor;
            cell.selectBt.backgroundColor =  selectModel.color;
          
        }
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    if (self.arr.count>0) {
        GatePublicSelectModel *publicSelectModel = self.arr [indexPath.row];
        
        return CGSizeMake(gateSelectTextHeight(publicSelectModel.titleText), self.height);
//          return CGSizeMake( (self.width - (self.arr.count-1)*10 - 30)/self.arr.count, self.height);
    }else{
          return CGSizeMake( (self.width - (self.arr.count-1)*10 - 30)/self.arr.count, self.height);
    }
  
}
//使用该方法不会模糊，根据屏幕密度计算
- (UIImage *)convertViewToImage:(UIView *)view {
    
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
    
}
//贝塞尔
- (UIImage *)QS_getCornerRadius:(CGFloat)c im:(UIImage*)rrr
{
   UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
    imageView.image = rrr;
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];

    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
     //结束画图
    UIGraphicsEndImageContext();
    return  imageView.image;
}
@end
