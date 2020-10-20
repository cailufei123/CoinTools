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
    
    
    
    
//    NSString * allStr = @"最近24小时，共有6014币民爆仓";
//    NSMutableAttributedString * allAttributedString =[allStr getMutableAttributedStringWhitSearchString:@"6014" searchStringColor:gateColor(@"5461d4") searchStringFont:gateFont(14, Normal)];
//    self.messageLB.attributedText =  allAttributedString;
}

-(void)setBurstinfo:(GTPublicContentModel *)burstinfo{
    _burstinfo = burstinfo;
    [self.collectionView reloadData];
    
    

    [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0] forLale:self.messageLB];
    NSMutableAttributedString * allAttributedString =[[NSString stringWithFormat:@"%@%@",_burstinfo.alldatalist[2].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0].content] getMutableAttributedStringWhitSearchString:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0].content searchStringColor:gateColor([GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0].color) searchStringFont:gateFont([GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0].size,Normal)];
   
    self.messageLB.attributedText = allAttributedString;
//    [NSString stringWithFormat:@"%@%@",_burstinfo.alldatalist[2].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[2].datalist.firstObject][0].content];
     
    
    
    
    [GTStyleManager setStyleWhit:_burstinfo.alldatalist[3].title forLale:self.titleLb];
    
    self.titleLb.text = [NSString stringWithFormat:@"%@%@",_burstinfo.alldatalist[3].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[3].datalist.firstObject][0].content];
   
    NSString * allStr  =
    [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@",
 
 _burstinfo.alldatalist[3].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[3].datalist.firstObject][0].content,
 
 _burstinfo.alldatalist[4].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[4].datalist.firstObject][0].content,
 
 _burstinfo.alldatalist[5].title.content,[GTDataManager getItemModelWhit:_burstinfo.alldatalist[5].datalist.firstObject][0].content
 ];
    
    NSMutableAttributedString * allAttribut=[allStr getMutableAttributedStringWhitSearchString:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[5].datalist.firstObject][0].content searchStringColor:gateColor([GTDataManager getItemModelWhit:_burstinfo.alldatalist[5].datalist.firstObject][0].color) searchStringFont:gateFont([GTDataManager getItemModelWhit:_burstinfo.alldatalist[5].datalist.firstObject][0].size, Normal)];
    
    
    self.titleLb.attributedText = allAttribut;

    
    
        
   
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
   
    return _burstinfo.alldatalist.count==6?2:0;
    
}


#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 GateHoursCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GateHoursCollectionViewCell" forIndexPath:indexPath];
   
    cell.titleView.backgroundColor = indexPath.row ==0 ? gateBackgroundOrangeColor: gateBackgroundBlueColor;
    cell.bagView.layer.borderColor = indexPath.row ==0 ? gateColor(@"f6d3c8").CGColor:  gateColor(@"c1c6ee").CGColor;
    
    if (indexPath.row == 0) {
        cell.titleLb.text = _burstinfo.alldatalist[0].title.content;
      
        [GTStyleManager setStyleWhit:_burstinfo.alldatalist[0].title forLale:cell.titleLb];
        cell.moneyLb.text =  [self getMoney:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[0].datalist.firstObject][0].content];
        
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[0].datalist.firstObject][0] forLale:cell.moneyLb];
        cell.machMoneyLb.text =[NSString stringWithFormat:@"≈%@",[self getMoney:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[0].datalist.firstObject][1].content]] ;

        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[0].datalist.firstObject][1] forLale:cell.machMoneyLb];
        
    }else{
        cell.titleLb.text = _burstinfo.alldatalist[1].title.content;
        [GTStyleManager setStyleWhit:_burstinfo.alldatalist[0].title forLale:cell.titleLb];
        cell.moneyLb.text =  [self getMoney:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[1].datalist.firstObject][0].content];
       
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[1].datalist.firstObject][0] forLale:cell.moneyLb];
        cell.machMoneyLb.text =  [NSString stringWithFormat:@"≈%@",[self getMoney:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[1].datalist.firstObject][1].content]];
       
        [GTStyleManager setStyleWhit:[GTDataManager getItemModelWhit:_burstinfo.alldatalist[1].datalist.firstObject][1] forLale:cell.machMoneyLb];
    }
  
    return cell;
    
}

-(NSString *)getMoney:(NSString * )money{
    // value 为 y 轴的值
    double  value = [money doubleValue];
        NSString * moneyStr = @"0";
//            if (value>=100000000){
//               moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value * 0.00000001];
//            }else
                if (value>=10000) {
                      moneyStr = [NSString stringWithFormat:@"$%0.2lf万",value * 0.00001];
            }else {
               moneyStr = [NSString stringWithFormat:@"$%0.2lf",value ];
              
            }
       return moneyStr;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

@end

