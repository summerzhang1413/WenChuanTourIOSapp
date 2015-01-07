//
//  YTKeyBoardTapBack.m
//  YTCHOOH
//
//  Created by 123 on 15-1-3.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import "YTKeyBoardTapBack.h"

@implementation YTKeyBoardTapBack

- (void)tapBackGround:(id)sender :(UITextField *)one :(UITextField *)two{
    UIViewController *con = sender;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:con action:@selector(tapOnce:textField:)];
    [tap setNumberOfTapsRequired:1];
    [con.view addGestureRecognizer:tap];
}

- (void)tapOnce:(UITextField *)one textField:(UITextField *)two{
    
}

@end
