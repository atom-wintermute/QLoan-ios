//
//  UIView+Gradient.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)addGradient {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    gradient.colors = @[(id)[UIColor ql_turquoiseColor].CGColor,
                        (id)[UIColor ql_blueColor].CGColor];
    [self.layer insertSublayer:gradient
                       atIndex:0];
}

- (void)deleteGradient {
    CALayer *layer = self.layer.sublayers[0];
    if ([layer isKindOfClass:[CAGradientLayer class]]) {
        [layer removeFromSuperlayer];
    }
}

@end
