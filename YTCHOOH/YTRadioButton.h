//
//  YTRadioButton.h
//  YTCHOOH
//
//  Created by 123 on 15-1-2.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

typedef enum {
    
    CheckButtonStyleDefault = 0 ,
    
    CheckButtonStyleBox = 1 ,
    
    CheckButtonStyleRadio = 2
    
} CheckButtonStyle;

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YTRadioButton : UIControl{

    UILabel * label ;
    UIImageView * icon ;
    BOOL checked ;
    id value , delegate ;
    CheckButtonStyle style ;
    NSString * checkname ,* uncheckname ; // 勾选／反选时的图片文件名
}

@property ( retain , nonatomic ) id value,delegate;

@property ( retain , nonatomic )UILabel* label;

@property ( retain , nonatomic )UIImageView* icon;

@property ( assign )CheckButtonStyle style;

-( CheckButtonStyle )style;

-( void )setStyle:( CheckButtonStyle )st;

-( BOOL )isChecked;

-( void )setChecked:( BOOL )b;

@end
