//
//  ViewController.m
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "ViewController.h"
#import "YMnineImageView.h"

@interface ViewController ()<YMnineIamgeViewDelegate>{

    NSMutableArray *imageArray;

}

@property (strong, nonatomic) YMnineImageView *ymNineView;

@property (strong, nonatomic) UIButton *btnAddOne;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
   
    [super viewDidLoad];
    
    imageArray = [[NSMutableArray alloc] init];

    [self.view addSubview:self.ymNineView];
    [self.view addSubview:self.btnAddOne];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - YMnineIamgeViewDelegate
-(NSInteger)ymnineImageView:(YMnineImageView *)ymnineImageView{
    return imageArray.count;
}

-(UIImage *)ymnineImageView:(YMnineImageView *)ymnineImageView index:(NSInteger)index{
    return [imageArray objectAtIndex:index];
}

-(void)didReloadSuccess:(CGFloat)viewHeight{
   
    CGRect rect = self.ymNineView.frame;
    rect.size.height = viewHeight;
    self.ymNineView.frame = rect;
    
}

#pragma mark - get set
-(YMnineImageView *)ymNineView{

    if (!_ymNineView) {
        _ymNineView = [[YMnineImageView alloc] init];
        _ymNineView.frame = CGRectMake(0, 0, Screen_Width, _ymNineView.itemHeight);
        _ymNineView.delegate = self;
    }

    return _ymNineView;
}

-(UIButton *)btnAddOne{

    
    if (!_btnAddOne) {
        
        _btnAddOne = [[UIButton alloc] init];
        _btnAddOne.frame = CGRectMake(0, Screen_Height - 50, Screen_Width, 50);
        
        _btnAddOne.backgroundColor = [UIColor grayColor];
        [_btnAddOne addTarget:self action:@selector(clickAddOne:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnAddOne;
    
}
-(void)clickAddOne:(UIButton *)buutton{
    [imageArray addObject:[UIImage imageNamed:@"welcome_index3"]];
    [self.ymNineView reloadData];
    
}


@end
