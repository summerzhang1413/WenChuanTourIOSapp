//
//  YTForgetPwdViewController.m
//  YTCHOOH
//
//  Created by 123 on 15-1-2.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import "YTForgetPwdViewController.h"

@interface YTForgetPwdViewController ()

@end

@implementation YTForgetPwdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self tapBackground];
}

-(void)tapBackground //在ViewDidLoad中调用
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}

-(void)tapOnce//手势方法
{
    [_tel resignFirstResponder];
    [_device resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonForget:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
@end
