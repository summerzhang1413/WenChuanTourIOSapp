//
//  YTTabBarFirstViewController.m
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import "YTTabBarFirstViewController.h"
#import "YTMyDeviceViewController.h"

@interface YTTabBarFirstViewController ()

@end

@implementation YTTabBarFirstViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonMyDevice:(id)sender {
    YTMyDeviceViewController *myDeviceView = [[YTMyDeviceViewController alloc] init];
    myDeviceView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:myDeviceView animated:YES completion:^{
        
    }];
    
}
@end
