//
//  YMnineImageCell.h
//  YMChooseImageView
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYMnineImageCell @"YMnineImageCell"

@interface YMnineImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

+(instancetype)initCell:(UICollectionView *)initCell withIndexPath:(NSIndexPath *)indexPath withMemberArray:(UIImage *)image;

@end
