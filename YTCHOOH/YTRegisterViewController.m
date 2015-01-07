//
//  YTRegisterViewController.m
//  YTCHOOH
//
//  Created by 123 on 15-1-2.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import "YTRegisterViewController.h"
#import "YTRadioButton.h"
#import "YTUserProtocolViewController.h"

@interface YTRegisterViewController ()

@end

@implementation YTRegisterViewController

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
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(30, 250, 300, 30);
    [button setTitle:@"已阅读并同意《空气检测系统移动应用使用协议》" forState:UIControlStateNormal];
    button.font = [UIFont systemFontOfSize:11];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonUserProtocol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    YTRadioButton *radioButton = [[YTRadioButton alloc] initWithFrame:CGRectMake(20, 250, 50, 30)];
    radioButton.label.text = @"";
    //    radioButton.value = [[NSNumber alloc] initWithInt:14];
    radioButton.style = CheckButtonStyleRadio;
    [self.view addSubview:radioButton];
    
//    [self tapBackground];
    
}

- (void)buttonUserProtocol{
    YTUserProtocolViewController *userProtocolView = [[YTUserProtocolViewController alloc] init];
    userProtocolView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:userProtocolView animated:YES completion:^{
        
    }];
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
    [_pwd resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)buttonRegister:(id)sender {
    [_tel resignFirstResponder];
    [_pwd resignFirstResponder];
}
@end
