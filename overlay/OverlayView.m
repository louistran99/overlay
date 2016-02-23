//
//  OverlayView.m
//  Postlets
//
//  Created by Louis Tran on 2/27/15.
//  Copyright (c) 2015 Zillow Inc. All rights reserved.
//

#import "OverlayView.h"
#import "PostletColorUtils.h"


@implementation OverlayView
-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dashLine = NO;
    }
    return nil;
}

-(NSArray*) getRectangles {
    return _rectangles;
}

-(void) setRectangles:(NSArray *)rectangles {
    _rectangles = rectangles;
    [self setNeedsDisplay];
}

-(NSArray*) getLabels {
    return _labels;
}

-(void) setLabels:(NSArray *)labels {
    _labels = labels;
    [self updateRotations];
}

//-(BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return NO;
//}

-(void) updateRotations {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
//  CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    CGFloat buttonRotation = 0.0f;
    switch (deviceOrientation) {
        case UIDeviceOrientationLandscapeRight:
            buttonRotation = -M_PI_2;
            break;
        case UIDeviceOrientationLandscapeLeft:
            buttonRotation = M_PI_2;
            break;
        case UIDeviceOrientationPortrait:
            break;
        default:
            buttonRotation = 0.0f;
            break;
    }
    CGAffineTransform buttonTransform = CGAffineTransformMakeRotation(buttonRotation);
    [UIView animateWithDuration:0.25f animations:^{
        [_labels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imageView = [_labels objectAtIndex:idx];
            imageView.transform = buttonTransform;
            ;
        }];
    } completion:^(BOOL finished) {
    }];
}


-(void) drawOverLay:(CGContextRef) context {
    CGContextBeginPath(context);
    CGContextSetRGBFillColor(context, 0, 0, 0, 0.5f);
    NSArray *points = @[[NSValue valueWithCGPoint:CGPointZero], [NSValue valueWithCGPoint:CGPointMake(self.frame.size.width, 0)],
                        [NSValue valueWithCGPoint:CGPointMake(self.frame.size.width, self.frame.size.height)],
                        [NSValue valueWithCGPoint:CGPointMake(0, self.frame.size.height)]];
    [points enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSValue *pointAsValue = [points objectAtIndex:idx];
        if (idx==0) {
            CGContextMoveToPoint(context, pointAsValue.CGPointValue.x, pointAsValue.CGPointValue.y);
        } else {
            CGContextAddLineToPoint(context, pointAsValue.CGPointValue.x, pointAsValue.CGPointValue.y);
        }
    }];
    CGContextClosePath(context);
    
    if (_rectangles) {
        [_rectangles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSValue *rectAsValue = [_rectangles objectAtIndex:idx];
            CGRect rect = rectAsValue.CGRectValue;
            CGPoint center = rect.origin;
            center.x += rect.size.width/2.0f;
            center.y += rect.size.width/2.0f;
            CGFloat radius = rect.size.width/2.0f;
            CGContextMoveToPoint(context, center.x, center.y);
            CGContextAddArc(context, center.x, center.y, radius, 0, M_PI*2, 0);   // using the non-zero winding rule to punch out a hole here...
            // Subba, draw your own rounded rectangle path here
            CGContextClosePath(context);
        }];
    }
    CGContextDrawPath(context, kCGPathEOFill);
}


-(void) drawDashLines:(CGContextRef) context {
    if (_rectangles) {
        [_rectangles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            const CGFloat *colors = CGColorGetComponents([PostletColorUtils zillowBlue].CGColor);
            CGContextSetRGBStrokeColor(context, colors[0], colors[1], colors[2], 1.0);
            const CGFloat patterns[2] = {2.0f, 2.0f};
            CGContextSetLineDash(context, 0.0, patterns, 2);
            NSValue *rectAsValue = [_rectangles objectAtIndex:idx];
            CGRect rect = rectAsValue.CGRectValue;
            CGContextAddEllipseInRect(context, rect);
        }];
    }
    CGContextSetLineWidth(context, 2.0f);
    CGContextStrokePath(context);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawOverLay:UIGraphicsGetCurrentContext()];
    if (_dashLine) {
        [self drawDashLines:UIGraphicsGetCurrentContext()];
    }
}

@end
