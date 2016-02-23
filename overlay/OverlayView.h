//
//  OverlayView.h
//  Postlets
//
//  Created by Louis Tran on 2/27/15.
//  Copyright (c) 2015 Zillow Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayView : UIView

@property (nonatomic) BOOL dashLine;
@property (nonatomic, strong) NSArray *rectangles;
@property (nonatomic, strong) NSArray *labels;


-(void) updateRotations;

@end
