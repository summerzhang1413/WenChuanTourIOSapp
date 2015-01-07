//
//  PNPlot.h
//  YTCHOOH
//
//  Created by 123 on 15-1-4.
//  Copyright (c) 2015年 ifox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PNPlot : NSObject

@property (nonatomic, strong) NSArray *plottingValues;
@property (nonatomic, strong) NSArray *plottingPointsLabels;
@property (nonatomic, strong) UIColor* lineColor;
@property (nonatomic, assign) float lineWidth;

@end
