//
//  YTTabBarThirdViewController.m
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import "YTTabBarThirdViewController.h"

@interface YTTabBarThirdViewController ()

@end

@implementation YTTabBarThirdViewController

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
    
//    _scrollView.frame = CGRectMake(0, 50, 320, 460);
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
