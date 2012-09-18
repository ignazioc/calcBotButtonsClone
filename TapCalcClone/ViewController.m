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
	TapCalcButton *btn = [[TapCalcButton alloc]initWithFrame:CGRectMake(120, 243, 68, 46)];
    [self.view addSubview:btn];
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
