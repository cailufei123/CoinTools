//
//  GTMainCoinQuotationListTableViewCell.m
//  CoinTools
//
//  Created by MAC on 2020/9/16.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTMainCoinQuotationListTableViewCell.h"
#import "GTRightCollectionViewCell.h"
#import "GTRightCollectionViewCell.h"
#import "GTNewRightCollectionViewCell.h"
@interface LeftTableViewTableViewCell()
@property (strong, nonatomic)  UILabel *nameLb;
@end
@implementation LeftTableViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setNameLbLyout];
    
   
  
    return self;
}
-(UILabel *)nameLb{
    if (!_nameLb) {
           _nameLb = [[UILabel alloc] init];
           [self.contentView addSubview:_nameLb];
//        _nameLb.backgroundColor = gateColor(@"F5F5F5");
        _nameLb.font = gateFont(12, Medium);
        _nameLb.numberOfLines = 2;
        _nameLb.textColor = gateColor(@"333B46");
        _nameLb.textAlignment = NSTextAlignmentLeft;
       }
       return _nameLb;
}
-(void)setNameLbLyout{
   [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(10);

       make.right.mas_equalTo(-10);
       make.top.mas_offset(0);
        make.bottom.mas_offset(0);
   }];
}



@end

@interface GTMainCoinQuotationListTableViewCell()

@property(nonatomic,strong)NSArray * leftTitles;
@end
@implementation GTMainCoinQuotationListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizesSubviews = NO;
//    self.leftTitles = [NSArray arrayWithObjects:@"币种",@"报价",@"市场情绪",@"持仓量",@"爆仓金额",@"多控人数比",@"实盘多空金额比",@"季度溢价",@"全网多空",@"永续合约",@"OKEX\n精英趋向",@"OKEX\n持仓指标",@"融资融币汇率", nil];
    self.leftTableWight.constant = scrWeiht/4;
    [self setLeftTableView];
    [self setRightCoRllectionView];
    self.titleLb.font = gateFont(16, Medium);
    self.titleLb.textColor = gateColor(@"333B46");
    self.moreLb.textColor = gateColor(@"333B46");
    self.moreLb.font = gateFont(12, Medium);
}

- (void)setHomepaglist:(GTHomepaglistModel *)homepaglist{
    _homepaglist = homepaglist;
    self.leftTitles = homepaglist.alldatalist.firstObject.datalist;
     [self.leftTableView reloadData];
       [self.rightCollectionView reloadData];
}

-(void)setLeftTableView{

        self.leftTableView.backgroundColor = UIColor.whiteColor;
    if (@available(iOS 11.0, *)) {
        self.leftTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                  }
    
            self.leftTableView.showsVerticalScrollIndicator = NO;
            self.leftTableView.estimatedRowHeight = 0;
            self.leftTableView.estimatedSectionHeaderHeight = 0;
            self.leftTableView.estimatedSectionFooterHeight = 0;
            self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            self.leftTableView.delegate = self;
            self.leftTableView.dataSource = self;
           gateTableRegisterClass(self.leftTableView, @"LeftTableViewTableViewCell");
    
}
-(void)setRightCoRllectionView{
   UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                          layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
                          layout.minimumLineSpacing = 0;
                          layout.minimumInteritemSpacing =0;
//                          layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
                          layout.itemSize = CGSizeMake((scrWeiht)/4, 400+120);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //                      [_collectionView setCollectionViewLayout:layout];
             [self.rightCollectionView setCollectionViewLayout:layout];
    self.rightCollectionView.bounces = NO;
    self.rightCollectionView.showsVerticalScrollIndicator = NO;
     self.rightCollectionView.showsHorizontalScrollIndicator = NO;
    
  if (@available(iOS 11.0, *)) {
           self.rightCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
   } else {
           self.autoresizesSubviews = NO;
   }
    self.rightCollectionView.autoresizesSubviews = NO;
    self.rightCollectionView.showsVerticalScrollIndicator = NO;
self.rightCollectionView.backgroundColor = gateColor(@"ffffff");
               gateCollectionRegisterNib(self.rightCollectionView, @"GTNewRightCollectionViewCell");
               self.rightCollectionView.delegate = self;
              self.rightCollectionView.dataSource = self;
//           if (@available(iOS 11.0, *)) {
 
               
//                            }
           //注册头尾试图
                 [self.rightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
                 [self.rightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
   
    
}

#pragma mark -kkkkk
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
    return self.homepaglist.alldatalist.count - 1;
    
}
#pragma mark - collectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.width, 40);
//}
//
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0.01, 0.01);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
     return CGSizeMake(0.01, 0.01);
}
#pragma mark -点击按钮
- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    GTAlldatalistModel *alldatalistModel = self.homepaglist.alldatalist[indexPath.row];
    GTNewRightCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTNewRightCollectionViewCell" forIndexPath:indexPath];
//    cell.alldatalistModel = self.homepaglist.alldatalist[indexPath.row+1];
  
    return cell;
    
}








- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [UIView new];
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
      return 0.01;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.leftTitles.count + 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
     LeftTableViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.nameLb.text= self.homepaglist.alldatalist.firstObject.title.content;
         [GTStyleManager setStyleWhit:self.homepaglist.alldatalist.firstObject.title forLale:cell.nameLb];
    }else{
          GTHomeTitleModel * homeTitleModel = self.leftTitles[indexPath.row-1];
         cell.nameLb.text= homeTitleModel.content;
          [GTStyleManager setStyleWhit:homeTitleModel forLale:cell.nameLb];
    }
  
    if (indexPath.row%2 == 0) {
          cell.backgroundColor = gateColor(@"F5F5F5");
          cell.nameLb.backgroundColor = gateColor(@"F5F5F5");
    }else{
        cell.backgroundColor = gateColor(@"ffffff");
          cell.nameLb.backgroundColor = gateColor(@"ffffff");
    }
   return cell;
}



@end

