//
//  UIButton+Enable.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "UIButton+Enable.h"

@implementation UIButton (Enable)

- (void)activate:(BOOL)activate {
    if (activate) {
        [self addGradient];
        self.userInteractionEnabled = YES;
        [self setTitleColor:[UIColor colorWithWhite:1.0 alpha:1.0]
                   forState:UIControlStateNormal];
    } else {
        [self deleteGradient];
        [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.05]];
        self.userInteractionEnabled = NO;
        [self setTitleColor:[UIColor colorWithWhite:0.0 alpha:0.2]
                   forState:UIControlStateNormal];
    }
}

@end
