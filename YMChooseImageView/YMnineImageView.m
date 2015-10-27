//
//  YMnineImageView.m
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMnineImageView.h"
#import "YMnineImageFlowLayout.h"
#import "YMnineImageCell.h"



@interface YMnineImageView()<UICollectionViewDelegate, UICollectionViewDataSource>{
    
}

//九宫图
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation YMnineImageView

@synthesize delegate;

-(id)init{

    self = [super init];
    
    if (self) {

        self.maxCount = 3;
        self.itemCount = 3;
        
        self.itemHeight = ([UIScreen mainScreen].bounds.size.width) / self.itemCount - 16;
        
        [self addSubview:self.collectionView];
    }
    
    return self;
}

-(void)reloadData{
    
    if (self.maxCount <  [delegate ymnineImageView:self]) return;
   
    CGRect rect = self.collectionView.frame;
    rect.size.height = (self.itemHeight + 8) * (([delegate ymnineImageView:self] / self.itemCount) + 1);
    
    self.collectionView.frame = rect;
    [self.collectionView reloadData];

    [self.delegate didReloadSuccess:(self.itemHeight + 8) * (([delegate ymnineImageView:self] / self.itemCount) + 1)];
    

}

#pragma mark - collocetionDelete
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@" %ld ", [delegate ymnineImageView:self]);
    return [delegate ymnineImageView:self];
}

//init cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YMnineImageCell *cell;
    
    if (indexPath.row == [delegate ymnineImageView:self] + 1) {
        cell  = [YMnineImageCell initCell:collectionView withIndexPath:indexPath withMemberArray:nil];
    } else {
        cell  = [YMnineImageCell initCell:collectionView withIndexPath:indexPath withMemberArray:[delegate ymnineImageView:self index:indexPath.row]];
    }
    

    

    
    return cell;
}


#pragma mark - get set
-(UICollectionView *)collectionView{

    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(8, 0, Screen_Width - 16, self.itemHeight) collectionViewLayout:[YMnineImageFlowLayout initFlowLayout:3]];
       
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        _collectionView.backgroundColor = [UIColor whiteColor];
        UINib *cellNib = [UINib nibWithNibName:kYMnineImageCell bundle: [NSBundle mainBundle]];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:kYMnineImageCell];

    }
    
    return _collectionView;
}
-(void)setMaxCount:(NSInteger)maxCount{
    _maxCount = 9;
}

-(void)setItemCount:(NSInteger)itemCount{
    _itemCount = 3;
}

@end
