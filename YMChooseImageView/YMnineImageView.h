//
//  YMnineImageView.h
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMImage.h"

#define Screen_Width  [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

@protocol YMnineIamgeViewDelegate;

@interface YMnineImageView : UIView

//添加网络图片
-(void)addWebImageWithUrl:(NSString *)url userInfo:(NSMutableDictionary *)userInfo;
//添加本地图片
-(void)addLocalImageWithUIimage:(UIImage *)image;

//刷新页面
-(void)reloadYMnineView;


//获取图片
-(NSMutableArray *)getImageListByImageType:(YMImageType)imageType;


@property (nonatomic) BOOL isshowDeleteAlert;

@property (nonatomic, weak) id<YMnineIamgeViewDelegate> delegate;

@end




@protocol YMnineIamgeViewDelegate <NSObject>

@optional
-(void)didClickAddButton;

@end


