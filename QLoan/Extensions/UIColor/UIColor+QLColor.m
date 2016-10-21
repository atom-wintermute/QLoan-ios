//
//  UIColor+QLColor.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "UIColor+QLColor.h"

@implementation UIColor (QLColor)

+ (UIColor *)ql_blueColor {
    return [UIColor colorWithRed:0.0/255.0 green:179.0/255.0 blue:227.0/255.0 alpha:1.0];
}

+ (UIColor *)ql_turquoiseColor {
    return [UIColor colorWithRed:23.0/255.0 green:210.0/255.0 blue:221.0/255.0 alpha:1.0];
}

+ (UIColor *)ql_selectedCellColor {
    return [UIColor colorWithRed:238.0/255.0 green:250.0/255.0 blue:253.0/255.0 alpha:1.0];
}

+ (UIColor *)ql_shadowColor {
    return [UIColor colorWithRed:3.0/255.0 green:156.0/255.0 blue:194.0/255.0 alpha:0.31];
}

@end
