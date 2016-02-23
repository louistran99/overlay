//
//  ColorUtils.h
//  Postlets
//
//  Created by John Huang on 3/26/14.
//  Copyright (c) 2014 Zillow Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ColorUtils : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIImage *)imageFromColor:(UIColor *)color;
@end
