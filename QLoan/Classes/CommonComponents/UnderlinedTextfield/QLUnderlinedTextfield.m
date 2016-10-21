//
//  QLUnderlinedTextfield.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLUnderlinedTextfield.h"

@implementation QLUnderlinedTextfield

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
	[self layoutIfNeeded];
	
	self.layer.sublayers[0].opacity = 0.0;
	CALayer *underlinedLayer = [self createUnderlinedLayer];
	[self.layer addSublayer:underlinedLayer];
	
	self.layer.masksToBounds = YES;
}

- (CALayer *)createUnderlinedLayer {
	CGFloat borderWidth = 0.5;
	CALayer *newLayer = [CALayer new];
	
	newLayer.borderColor = [[UIColor lightGrayColor] CGColor];
	newLayer.frame = CGRectMake(0,
								CGRectGetHeight(self.frame) - borderWidth,
								CGRectGetWidth(self.frame),
								borderWidth);
	newLayer.borderWidth = borderWidth;
	
	return newLayer;
}

@end
