//
//  PostletColorUtils.m
//  Postlets
//
//  Created by John Huang on 5/20/14.
//  Copyright (c) 2014 Zillow Inc. All rights reserved.
//

#import "PostletColorUtils.h"
#import "ColorUtils.h"

#define ORANGE_COLOR @"#FE7400"
//#define ORANGE_COLOR @"#CB4700"
#define BLUE_COLOR @"#326B90"
#define GREY_COLOR @"#808080"
#define SLIGHT_GRAY @"#EBEBEB"
#define LIGHT_GRAY @"#AAAAAA"
#define DARK_GRAY  @"#333333"
#define MEDIUM_GRAY  @"#666666"
#define BLUE_GRAY  @"#1274b4"
#define BLACK_101010 @"#101010"
#define RED_COLOR @"#FF0000"
#define GREEN_COLOR @"#00FF00"
#define DATE_EXPIRES_COLOR @"ED1C24"

@implementation PostletColorUtils
+(UIColor*) statusDenied {
    return [ColorUtils colorFromHexString:@"#ED1C24"];
}

+(UIColor*) statusPending {
    return [ColorUtils colorFromHexString:@"#CCCCCC"];
}

+(UIColor*) statusActive {
    return [ColorUtils colorFromHexString:@"#92CA3B"];
}

+(UIColor*) dateExpiresColor {
    return [ColorUtils colorFromHexString:DATE_EXPIRES_COLOR];
}

+(UIColor*) black101010 {
    return [ColorUtils colorFromHexString:BLACK_101010];
}


+ (UIColor *)orangeColor
{
    return [ColorUtils colorFromHexString:ORANGE_COLOR];
}

+ (UIColor *)blueColor
{
    return [ColorUtils colorFromHexString:BLUE_COLOR];
}

+ (UIColor *)toolbarColor
{
    return [ColorUtils colorFromHexString:GREY_COLOR];
}

+ (UIColor *)slightGrayColor
{
    return [ColorUtils colorFromHexString:SLIGHT_GRAY];
}

+ (UIColor *)lightGrayColor
{
    return [ColorUtils colorFromHexString:LIGHT_GRAY];
}

+(UIColor *)mediumGrayColor
{
    return [ColorUtils colorFromHexString:MEDIUM_GRAY];
}

+(UIColor *)darkGrayColor
{
    return [ColorUtils colorFromHexString:DARK_GRAY];
}

+ (UIColor *)blueGrayColor
{
    return [ColorUtils colorFromHexString:BLUE_GRAY];
}

+ (UIColor *)barColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)barBlueColor
{
    return [ColorUtils colorFromHexString:@"#007AFF"];
}

+(UIColor*) redColor {
    return [ColorUtils colorFromHexString:RED_COLOR];
}

+(UIColor*) greenColor {
    return [ColorUtils colorFromHexString:GREEN_COLOR];
}

+(UIColor*) zillowBlue {
    return [ColorUtils colorFromHexString:@"#0074E4"];
}

+(UIColor*) zillowDarkBlue {
    return [ColorUtils colorFromHexString:@"#1B5098"];
}

+(UIColor*) colorForKey:(NSString*) listingStatus {
    if ([listingStatus isEqualToString:@"Posted"]) {
        return [PostletColorUtils statusActive];
    } else if ([listingStatus isEqualToString:@"Rejected"]
               || [listingStatus isEqualToString:@"Blocked"]
               || [listingStatus isEqualToString:@"Manhattan Exclusion"]
               || [listingStatus isEqualToString:@"Declined"]) {
        return [PostletColorUtils statusDenied];
    } else if ([listingStatus isEqualToString:@"Pending"]
               || [listingStatus isEqualToString:@"Inactive Postlet"])  {
        return [PostletColorUtils statusPending];
    } else {
        return [UIColor clearColor];
    }
}

@end
