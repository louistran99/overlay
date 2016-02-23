//
//  PostletColorUtils.h
//  Postlets
//
//  Created by John Huang on 5/20/14.
//  Copyright (c) 2014 Zillow Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PostletColorUtils : NSObject

+(UIColor*) statusDenied;
+(UIColor*) statusPending;
+(UIColor*) statusActive;
+ (UIColor *)dateExpiresColor;
+ (UIColor *)orangeColor;
+ (UIColor *)blueColor;
+ (UIColor *)toolbarColor;
+ (UIColor *)slightGrayColor;
+ (UIColor *)lightGrayColor;
+ (UIColor *)mediumGrayColor;
+ (UIColor *)darkGrayColor;
+ (UIColor *)blueGrayColor;
+ (UIColor *)barColor;
+ (UIColor *)barBlueColor;
+ (UIColor *)black101010;
+ (UIColor*) greenColor;
+ (UIColor*) redColor;
+(UIColor*) zillowBlue;
+(UIColor*) colorForKey:(NSString*) listingStatus;
+(UIColor*) zillowDarkBlue;
@end
