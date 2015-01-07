//
//  YTViewController.m
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import "YTViewController.h"
#import "YTTabBarFirstViewController.h"
#import "YTTabBarSecondViewController.h"
#import "YTTabBarThirdViewController.h"
#import "YTRegisterViewController.h"
#import "YTForgetPwdViewController.h"
#import "YTAppDelegate.h"
#import "YTKeyBoardTapBack.h"

#define imageCount 3

@interface YTViewController ()

@end

@implementation YTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger isFirstBuild = [userDefaults integerForKey:@"first"];
    if (isFirstBuild) {
        // 不是第一次安装
        // 添加启动图片(无缓存方式)
        NSString *path = [[NSBundle mainBundle] pathForResource:@"welcome.jpg" ofType:nil];
        UIImage *imageLaunch = [[UIImage alloc] initWithContentsOfFile:path];
        UIImageView *imageViewLaunch = [[UIImageView alloc] initWithImage:imageLaunch];
        imageViewLaunch.frame = CGRectMake(0, 0, viewWidth, viewHeight);
        [self.view addSubview:imageViewLaunch];
        
        [UIView animateWithDuration:2.0 animations:^{
            imageViewLaunch.alpha = 0.95;
        } completion:^(BOOL finished) {
            [imageViewLaunch removeFromSuperview];
            [_scrollViewOut removeFromSuperview];
        }];
        
    }else{
        // 是第一次安装
        [userDefaults setInteger:1 forKey:@"first"];
        [userDefaults synchronize];
        // 添加引导图片
//        CGFloat w = _scrollViewOut.frame.size.width;
//        CGFloat h = _scrollViewOut.frame.size.height;
//        NSLog([NSString stringWithFormat:@"scrollview--width %f, height %f, view--width %f, height %f", w, h, viewWidth, viewHeight ]);
        for(int i = 0; i < imageCount; i++){
            UIImageView *imageViewGuide = [[UIImageView alloc] init];
            imageViewGuide.frame = CGRectMake(i * viewWidth, 0, viewWidth, viewHeight);
            NSString *imageName = [NSString stringWithFormat:@"welcome0%d.jpg", i + 1 ];
            NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
            UIImage *imageGuide = [[UIImage alloc] initWithContentsOfFile:path];
            imageViewGuide.image = imageGuide;
            imageViewGuide.tag = i + 10;
            
            [_scrollViewOut addSubview:imageViewGuide];
            
            if (i == 2) {
                UIButton *buttonGo = [[UIButton alloc] init];
                buttonGo.frame = CGRectMake(i * viewWidth, viewHeight * 0.9, viewWidth, 30);
//                buttonGo.center = CGPointMake(i * viewWidth + (viewWidth * 0.5), viewHeight * 0.9);
                [buttonGo setTitle:@"马上体验>>" forState:UIControlStateNormal];
                [buttonGo addTarget:self action:@selector(buttonGo) forControlEvents:UIControlEventTouchUpInside];
                buttonGo.tag = i + 11;
                
                [_scrollViewOut addSubview:buttonGo];

            }
            
        }
        // 因为勾选了autolayout，所以此处其实无效
//        _scrollView.contentSize = CGSizeMake(imageCount * w, 0);
        _scrollViewOut.bounces = NO;
        _scrollViewOut.showsHorizontalScrollIndicator = NO;
        _scrollViewOut.pagingEnabled = YES;
        
    }
    
    // 点击空白处可以退出键盘
    [self tapBackground];
    
}
// 解决scrollview和autolayout的冲突
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _scrollViewOut.contentSize = CGSizeMake(imageCount * _scrollViewOut.frame.size.width, 0);
}

-(void)buttonGo{
    [UIView animateWithDuration:1.0 animations:^{
        _scrollViewOut.alpha = 0;
    } completion:^(BOOL finished) {
        [_scrollViewOut removeFromSuperview];
    }];
    
}
    // 隐藏状态栏
//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}

- (IBAction)loginButton:(id)sender {
    YTTabBarFirstViewController *viewController1;
    YTTabBarSecondViewController *viewController2;
    YTTabBarThirdViewController *viewController3;
    
    viewController1 = [[YTTabBarFirstViewController alloc] initWithNibName:@"YTTabBarFirstViewController" bundle:nil];
    viewController1.title = @"First";
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"我的设备" image:nil tag:1];
    // 已经被摒弃了
    //    [item1 setFinishedSelectedImage:[UIImage imageNamed:@"device.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"device2.png"]];
    item1.image = [UIImage imageNamed:@"device.png"];
    item1.selectedImage = [UIImage imageNamed:@"device2.png"];
    viewController1.tabBarItem = item1;
    
    viewController2 = [[YTTabBarSecondViewController alloc] initWithNibName:@"YTTabBarSecondViewController" bundle:nil];
    viewController2.tabBarItem.title = @"历史记录";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"device.png"];
    viewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"device2.png"];
    
    viewController3 = [[YTTabBarThirdViewController alloc] initWithNibName:@"YTTabBarThirdViewController" bundle:nil];
    viewController3.tabBarItem.title = @"更多...";
    viewController3.tabBarItem.image = [UIImage imageNamed:@"device.png"];
    viewController3.tabBarItem.selectedImage = [UIImage imageNamed:@"device2.png"];
    
    self.tabBarController = [[UITabBarController alloc] init];
    //    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, nil];
    YTAppDelegate * app = (YTAppDelegate*)[[UIApplication sharedApplication] delegate] ;
    [app.window setRootViewController:self.tabBarController];
    
}

-(void)tapBackground //在ViewDidLoad中调用
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}

-(void)tapOnce//手势方法
{
    [_labelUsername resignFirstResponder];
    [_labelPwd resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputBegin:(id)sender {
    UITextField *text = (UITextField *)sender;
    CGFloat y = text.frame.origin.y;
    CGFloat height = text.frame.size.height;
    // 如果组件的高度大于键盘的高度（216），才将视图往上移动
    CGFloat yView = self.view.frame.size.height;
    if ((yView - (y + height)) < 216) {
        [UIView animateWithDuration:1.0 animations:^{
            CGPoint offset = CGPointMake(0, 216);
            [_scrollView setContentOffset:offset animated:YES];
        }];
    }
}

- (IBAction)inputEnd:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        CGPoint offset = CGPointMake(0, 0);
        [_scrollView setContentOffset:offset animated:YES];
    }];
}

- (IBAction)registerButton:(id)sender {
    YTRegisterViewController *registerView = [[YTRegisterViewController alloc] init];
    registerView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:registerView animated:YES completion:^{
        
    }];
}

- (IBAction)forgetPwdButton:(id)sender {
    YTForgetPwdViewController *forgetPwdView = [[YTForgetPwdViewController alloc] init];
    forgetPwdView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:forgetPwdView animated:YES completion:^{
        
    }];
    
}
@end
