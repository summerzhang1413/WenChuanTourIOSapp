//
//  YTViewController.h
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTViewController : UIViewController <UITabBarControllerDelegate>


@property (strong, nonatomic) UITabBarController *tabBarController;

@property (weak, nonatomic) IBOutlet UITextField *labelUsername;

@property (weak, nonatomic) IBOutlet UITextField *labelPwd;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewOut;

- (IBAction)loginButton:(id)sender;

- (IBAction)inputBegin:(id)sender;

- (IBAction)inputEnd:(id)sender;

- (IBAction)registerButton:(id)sender;

- (IBAction)forgetPwdButton:(id)sender;


@end
