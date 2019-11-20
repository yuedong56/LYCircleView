//
//  ViewController.m
//  LYCircleView
//
//  Created by yuedongkui on 2019/11/20.
//  Copyright © 2019 LY. All rights reserved.
//

#import "ViewController.h"
#import "YRCircleProgressImageView.h"

@interface ViewController ()
{
    YRCircleProgressImageView *view;
}
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 400, 375, 44)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    view = [[YRCircleProgressImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    [view setCircleColorWithR:0 g:0 b:0 a:1];
}

- (void)sliderValueChanged:(UISlider *)slider
{
    view.progress = slider.value;
}


@end
