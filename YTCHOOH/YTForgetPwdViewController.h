//
//  YTForgetPwdViewController.h
//  YTCHOOH
//
//  Created by 123 on 15-1-2.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTForgetPwdViewController : UIViewController

- (IBAction)buttonForget:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tel;

@property (weak, nonatomic) IBOutlet UITextField *device;

@end
