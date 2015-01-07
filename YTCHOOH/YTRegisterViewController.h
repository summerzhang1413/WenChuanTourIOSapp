//
//  YTRegisterViewController.h
//  YTCHOOH
//
//  Created by 123 on 15-1-2.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTRegisterViewController : UIViewController

- (IBAction)finishView:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tel;

@property (weak, nonatomic) IBOutlet UITextField *pwd;

- (IBAction)buttonRegister:(id)sender;


@end
