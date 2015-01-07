//
//  YTUserProtocolViewController.m
//  YTCHOOH
//
//  Created by 123 on 15-1-3.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import "YTUserProtocolViewController.h"

@interface YTUserProtocolViewController ()

@end

@implementation YTUserProtocolViewController

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

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
