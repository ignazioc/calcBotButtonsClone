//
//  ViewController.m
//  TapCalcClone
//
//  Created by Ignazio Calò on 9/17/12.
//  Copyright (c) 2012 Ignazio Calò. All rights reserved.
//

#import "ViewController.h"
#import "TapCalcButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	TapCalcButton *btn = [[TapCalcButton alloc]initWithFrame:CGRectMake(220, 243, 68, 46)];
    [self.view addSubview:btn];
    
    UILabel *l  = [[UILabel alloc] initWithFrame:CGRectMake(180, 150, 120, 60)];
    [l setNumberOfLines:0];
    [l setTextAlignment:NSTextAlignmentCenter];
    [l setFont:[UIFont systemFontOfSize:16]];
    [l setBackgroundColor:[UIColor clearColor]];
    [l setTextColor:[UIColor whiteColor]];
    [l setText:@"This is my clone creates with coregraphic"];
    
    [self.view addSubview:l];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
