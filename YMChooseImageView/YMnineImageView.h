//
//  YMnineImageView.h
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Screen_Width  [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

@protocol YMnineIamgeViewDelegate;

@interface YMnineImageView : UIView

@property (nonatomic) NSInteger maxCount;                   //可添加最大数量 此版本固定9
@property (nonatomic) NSInteger itemCount;                  //一行显示出来的书里那个 此版本固定3

@property (nonatomic) CGFloat itemHeight;

-(void)reloadData;

@property (nonatomic, weak) id<YMnineIamgeViewDelegate> delegate;

@end

@protocol YMnineIamgeViewDelegate <NSObject>

// 返回数量
-(NSInteger)ymnineImageView:(YMnineImageView *)ymnineImageView;
// 返回Image
-(UIImage *)ymnineImageView:(YMnineImageView *)ymnineImageView index:(NSInteger)index;

@optional
-(void)didReloadSuccess:(CGFloat)viewHeight;

@end


