//
//  YTTabBarSecondViewController.m
//  YTCHOOH
//
//  Created by 123 on 14-12-29.
//  Copyright (c) 2014年 ifox. All rights reserved.
//

#import "YTTabBarSecondViewController.h"
#import "PNLineChartView.h"
#import "PNPlot.h"
#import "EColumnDataModel.h"
#import "EColumnChartLabel.h"
#import "EFloatBox.h"
#import "EColor.h"
#include <stdlib.h>

@interface YTTabBarSecondViewController ()

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) EFloatBox *eFloatBox;

@property (nonatomic, strong) EColumn *eColumnSelected;
@property (nonatomic, strong) UIColor *tempColor;

@end

@implementation YTTabBarSecondViewController

@synthesize tempColor = _tempColor;
@synthesize eFloatBox = _eFloatBox;
@synthesize eColumnChart = _eColumnChart;
@synthesize data = _data;
@synthesize eColumnSelected = _eColumnSelected;
@synthesize valueLabel = _valueLabel;

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
    
    CGFloat widthView = self.view.bounds.size.width;
    CGFloat heightView = self.view.bounds.size.height;
    // Formaldehyde甲醛
    PNLineChartView *lineChartViewFormaldehyde = [[PNLineChartView alloc] init];
    lineChartViewFormaldehyde.frame = CGRectMake(40, 90, widthView - 40, 200);
    lineChartViewFormaldehyde.backgroundColor = [UIColor clearColor];
    lineChartViewFormaldehyde.numberOfVerticalElements = 8;
//    lineChartViewFormaldehyde.pointerInterval = 10.0;
    
    NSArray* plottingDataValues1 =@[@0.3, @0.0, @0.6, @0.6, @0.5, @0.0, @0.7, @0.2, @0.2, @0.3, @0.4];
    
    lineChartViewFormaldehyde.max = 0.8;
    lineChartViewFormaldehyde.min = 0;
    
    lineChartViewFormaldehyde.interval = (lineChartViewFormaldehyde.max-lineChartViewFormaldehyde.min)/8;
    
    NSMutableArray* yAxisValues = [@[] mutableCopy];
    for (int i=0; i<9; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", lineChartViewFormaldehyde.min + lineChartViewFormaldehyde.interval * i];
        [yAxisValues addObject:str];
    }
    
    lineChartViewFormaldehyde.xAxisValues = @[@"00:00", @"01:00", @"02:00",@"03:00", @"04:00", @"05:00",@"06:00", @"07:00", @"08:00",@"09:00", @"10:00"];
    lineChartViewFormaldehyde.yAxisValues = yAxisValues;
    lineChartViewFormaldehyde.axisLeftLineWidth = 38;
    
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    //    plot1.plottingPointsLabels = plottingDataValues1;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 1;//线条的粗细
    
    [lineChartViewFormaldehyde addPlot:plot1];
    
    [self.view addSubview:lineChartViewFormaldehyde];
    
    UILabel *labelFormaldehyde = [[UILabel alloc] init];
    labelFormaldehyde.frame = CGRectMake(10, 90, 30, 90);
    labelFormaldehyde.textColor = [UIColor blueColor];
    labelFormaldehyde.text = @"甲\n醛\n浓\n度";
    labelFormaldehyde.numberOfLines = [labelFormaldehyde.text length];
    
    [self.view addSubview:labelFormaldehyde];
    
    UILabel *labelFormaldehydeUnit = [[UILabel alloc] init];
    labelFormaldehydeUnit.frame = CGRectMake(-20, 190, 80, 20);
    labelFormaldehydeUnit.font = [UIFont systemFontOfSize:10];
    labelFormaldehydeUnit.textColor = [UIColor grayColor];
    labelFormaldehydeUnit.text = @"(浓度mg/m³)";
    labelFormaldehydeUnit.transform = CGAffineTransformMakeRotation(-M_PI_2);

    [self.view addSubview:labelFormaldehydeUnit];
    
    
}

#pragma -mark- EColumnChartDataSource

- (NSInteger)numberOfColumnsInEColumnChart:(EColumnChart *)eColumnChart
{
    return [_data count];
}

- (NSInteger)numberOfColumnsPresentedEveryTime:(EColumnChart *)eColumnChart
{
    return 30;
}

- (EColumnDataModel *)highestValueEColumnChart:(EColumnChart *)eColumnChart
{
    EColumnDataModel *maxDataModel = nil;
    //    float maxValue = -FLT_MIN;
    float maxValue = 20;
    for (EColumnDataModel *dataModel in _data)
    {
        if (dataModel.value > maxValue)
        {
            maxValue = dataModel.value;
            maxDataModel = dataModel;
        }
    }
    return maxDataModel;
}

- (EColumnDataModel *)eColumnChart:(EColumnChart *)eColumnChart valueForIndex:(NSInteger)index
{
    if (index >= [_data count] || index < 0) return nil;
    return [_data objectAtIndex:index];
}

#pragma -mark- EColumnChartDelegate
- (void)eColumnChart:(EColumnChart *)eColumnChart
     didSelectColumn:(EColumn *)eColumn
{
    NSLog(@"Index: %d  Value: %f", eColumn.eColumnDataModel.index, eColumn.eColumnDataModel.value);
    
    if (_eColumnSelected)
    {
        _eColumnSelected.barColor = _tempColor;
    }
    _eColumnSelected = eColumn;
    _tempColor = eColumn.barColor;
    eColumn.barColor = [UIColor blackColor];
    
    _valueLabel.text = [NSString stringWithFormat:@"%.1f",eColumn.eColumnDataModel.value];
}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidEnterColumn:(EColumn *)eColumn
{
    /**The EFloatBox here, is just to show an example of
     taking adventage of the event handling system of the Echart.
     You can do even better effects here, according to your needs.*/
    NSLog(@"Finger did enter %d", eColumn.eColumnDataModel.index);
    CGFloat eFloatBoxX = eColumn.frame.origin.x + eColumn.frame.size.width * 1.25;
    CGFloat eFloatBoxY = eColumn.frame.origin.y + eColumn.frame.size.height * (1-eColumn.grade);
    if (_eFloatBox)
    {
        [_eFloatBox removeFromSuperview];
        _eFloatBox.frame = CGRectMake(eFloatBoxX, eFloatBoxY, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
        [_eFloatBox setValue:eColumn.eColumnDataModel.value];
        [eColumnChart addSubview:_eFloatBox];
    }
    else
    {
        _eFloatBox = [[EFloatBox alloc] initWithPosition:CGPointMake(eFloatBoxX, eFloatBoxY) value:eColumn.eColumnDataModel.value unit:@"kWh" title:@"Title"];
        _eFloatBox.alpha = 0.0;
        [eColumnChart addSubview:_eFloatBox];
        
    }
    eFloatBoxY -= (_eFloatBox.frame.size.height + eColumn.frame.size.width * 0.25);
    _eFloatBox.frame = CGRectMake(eFloatBoxX, eFloatBoxY, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        _eFloatBox.alpha = 1.0;
        
    } completion:^(BOOL finished) {
    }];
    
}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidLeaveColumn:(EColumn *)eColumn
{
    NSLog(@"Finger did leave %d", eColumn.eColumnDataModel.index);
    
}

- (void)fingerDidLeaveEColumnChart:(EColumnChart *)eColumnChart
{
    if (_eFloatBox)
    {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            _eFloatBox.alpha = 0.0;
            _eFloatBox.frame = CGRectMake(_eFloatBox.frame.origin.x, _eFloatBox.frame.origin.y + _eFloatBox.frame.size.height, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
        } completion:^(BOOL finished) {
            [_eFloatBox removeFromSuperview];
            _eFloatBox = nil;
        }];
        
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
