//
//  YMnineImageCell.m
//  YMChooseImageView
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMnineImageCell.h"



@implementation YMnineImageCell

@synthesize imageView;

+(instancetype)initCell:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath withMemberArray:(UIImage *)image{

    static NSString *identifierItem = kYMnineImageCell;
    
    YMnineImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifierItem owner:self options:nil] lastObject];
    }
    
    cell.imageView.image = image;
    
    return cell;

}

@end
