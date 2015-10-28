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

    


}
@property (strong, nonatomic) YMnineImageView *ymNineView;

@property (strong, nonatomic) UIButton *buttonMove;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
   
    [super viewDidLoad];
    [self.view addSubview:self.ymNineView];
    [self.view addSubview:self.buttonMove];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - YmImage View Delegate
-(void)didClickAddButton{
    NSLog(@" didClickAddButton  ");
    [self.ymNineView addLocalImageWithUIimage:[UIImage imageNamed:@"welcome_index3"]];
    [self.ymNineView reloadYMnineView];
}

-(void)heightIsChange:(CGFloat)height{
    
    self.buttonMove.frame = CGRectMake(0, self.ymNineView.frame.origin.y + height, Screen_Width, 50);
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

-(UIButton *)buttonMove{

    if (!_buttonMove) {
        _buttonMove = [[UIButton alloc] init];
        _buttonMove.frame = CGRectMake(0, self.ymNineView.frame.origin.y + self.ymNineView.frame.size.height, Screen_Width, 50);
        _buttonMove.backgroundColor = [UIColor grayColor];
    }
    
    return _buttonMove;
}


@end
