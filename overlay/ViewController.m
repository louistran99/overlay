//
//  ViewController.m
//  overlay
//
//  Created by Louis Tran on 2/23/16.
//  Copyright © 2016 IF. All rights reserved.
//

#import "ViewController.h"
#import "OverlayView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect = CGRectMake(160, 160, 100, 100);
    NSArray *rectangles = [NSArray arrayWithObject:[NSValue valueWithCGRect:rect]];
    [_overlay setRectangles:rectangles];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
