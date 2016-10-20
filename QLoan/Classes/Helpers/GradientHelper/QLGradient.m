//
//  QLGradient.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLGradient.h"

@implementation QLGradient

+ (void)addGradientForView:(UIView *)view {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    
    gradient.colors = @[(id)[[UIColor ql_turquoiseColor] CGColor],
                        (id)[[UIColor ql_blueColor] CGColor]];
    [view.layer insertSublayer:gradient
                       atIndex:0];
}

@end
