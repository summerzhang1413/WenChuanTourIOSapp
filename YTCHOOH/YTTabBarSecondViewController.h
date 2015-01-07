//
//  YTTabBarSecondViewController.h
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EColumnChart.h"

@interface YTTabBarSecondViewController : UIViewController <EColumnChartDelegate, EColumnChartDataSource>

@property (strong, nonatomic) EColumnChart *eColumnChart;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
