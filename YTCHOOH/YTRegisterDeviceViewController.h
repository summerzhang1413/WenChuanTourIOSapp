//
//  YTRegisterDeviceViewController.h
//  YTCHOOH
//
//  Created by 123 on 15-1-4.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTRegisterDeviceViewController : UIViewController

- (IBAction)buttonBack:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *wifiCount;

@property (weak, nonatomic) IBOutlet UITextField *wifiPwd;

@end
