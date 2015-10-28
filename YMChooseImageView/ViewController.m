//
//  ViewController.m
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "ViewController.h"
#import "YMnineImageView.h"

@interface ViewController ()<YMnineIamgeViewDelegate>

@property (strong, nonatomic) YMnineImageView *ymNineView;

@property (strong, nonatomic) UIButton *btnAddLocalOne;

@property (strong, nonatomic) UIButton *btnAddWebOne;

@property (strong, nonatomic) UIButton *btngetLocal;

@property (strong, nonatomic) UIButton *btngetWeb;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
   
    [super viewDidLoad];

    [self.view addSubview:self.btnAddLocalOne];
    [self.view addSubview:self.btnAddWebOne];
    [self.view addSubview:self.btngetLocal];
    [self.view addSubview:self.btngetWeb];
    
    [self.view addSubview:self.ymNineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark ymDelefate
-(void)didClickAddButton{
    [self.ymNineView addWebImageWithUrl:@"http://img.service.uniposts.com/uploadfile/product/1510/1445508606_58489.jpg@440w_1_1o" userInfo:nil];
    [self.ymNineView reloadYMnineView];
}



#pragma mark - get set
-(YMnineImageView *)ymNineView{

    if (!_ymNineView) {
      
        _ymNineView = [[YMnineImageView alloc] init];
        _ymNineView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - 120);
        _ymNineView.delegate = self;
    }

    return _ymNineView;
}


-(UIButton *)btngetLocal{
    
    if (!_btngetLocal) {
        
        _btngetLocal = [[UIButton alloc] init];
        _btngetLocal.frame = CGRectMake(0, Screen_Height - 110, Screen_Width / 2, 50);
        
        [_btngetLocal setTitle:@"btngetLocal" forState:UIControlStateNormal];
        
        _btngetLocal.backgroundColor = [UIColor grayColor];
        [_btngetLocal addTarget:self action:@selector(clickbtngetLocal:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btngetLocal;
}


-(void)clickbtngetLocal:(UIButton *)buutton{
    [self.ymNineView getImageListByImageType:YMImageTypeLocalImage];
}


-(UIButton *)btngetWeb{
    
    if (!_btngetWeb) {
        
        _btngetWeb = [[UIButton alloc] init];
        _btngetWeb.frame = CGRectMake(Screen_Width / 2 + 1, Screen_Height - 110, Screen_Width / 2, 50);
        
        [_btngetWeb setTitle:@"btngetWeb" forState:UIControlStateNormal];
        
        _btngetWeb.backgroundColor = [UIColor grayColor];
        [_btngetWeb addTarget:self action:@selector(clickbtngetWeb:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btngetWeb;
}

-(void)clickbtngetWeb:(UIButton *)buutton{
    
    for (YMImage *image in [self.ymNineView getImageListByImageType:YMImageTypeWebImage]) {
        NSLog(@"  %@  ", image.imgUrl);
        NSLog(@"  %ld  ", (long)image.deleteType);
        
    }

    
}



-(UIButton *)btnAddWebOne{

    if (!_btnAddWebOne) {
        
        _btnAddWebOne = [[UIButton alloc] init];
        _btnAddWebOne.frame = CGRectMake(Screen_Width / 2 + 1, Screen_Height - 50, Screen_Width / 2, 50);
        
        [_btnAddWebOne setTitle:@"btnAddWebOne" forState:UIControlStateNormal];
        
        _btnAddWebOne.backgroundColor = [UIColor grayColor];
        [_btnAddWebOne addTarget:self action:@selector(clickWebAddOne:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnAddWebOne;
}

-(void)clickWebAddOne:(UIButton *)buutton{
    [self.ymNineView addWebImageWithUrl:@"http://img.service.uniposts.com/uploadfile/product/1510/1445508606_58489.jpg@440w_1_1o" userInfo:nil];
    [self.ymNineView reloadYMnineView];
}


-(UIButton *)btnAddLocalOne{

    
    if (!_btnAddLocalOne) {
        
        _btnAddLocalOne = [[UIButton alloc] init];
        _btnAddLocalOne.frame = CGRectMake(0, Screen_Height - 50, Screen_Width / 2, 50);
        
        [_btnAddLocalOne setTitle:@"_btnAddLocalOne" forState:UIControlStateNormal];
        
        _btnAddLocalOne.backgroundColor = [UIColor grayColor];
        [_btnAddLocalOne addTarget:self action:@selector(clickAddOne:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnAddLocalOne;
    
}
-(void)clickAddOne:(UIButton *)buutton{
    [self.ymNineView addLocalImageWithUIimage:[UIImage imageNamed:@"welcome_index3"]];
    [self.ymNineView reloadYMnineView];
}


@end
