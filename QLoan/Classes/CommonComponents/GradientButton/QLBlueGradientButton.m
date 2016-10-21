//
//  QLBlueGradientButton.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBlueGradientButton.h"

@implementation QLBlueGradientButton

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self configureAppearance];
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self configureAppearance];
}

- (void)configureAppearance {
	[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self addGradient];
}

@end
