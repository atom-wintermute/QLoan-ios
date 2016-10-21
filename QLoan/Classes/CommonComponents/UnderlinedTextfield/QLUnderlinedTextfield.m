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
	//self.layer.sublayers[0].opacity = 0.0;
	CALayer *underlinedLayer = [self createUnderlinedLayer];
	[self.layer addSublayer:underlinedLayer];
	
//	self.layer.masksToBounds = YES;
//	self.clearsOnBeginEditing = YES;
}

- (CALayer *)createUnderlinedLayer {
	CGFloat borderWidth = 1.0;
	CALayer *newLayer = [CALayer new];
	
	newLayer.borderColor = [[UIColor grayColor] CGColor];
	newLayer.frame = CGRectMake(0,
								CGRectGetHeight(self.frame) - borderWidth,
								CGRectGetWidth(self.frame),
								borderWidth);
	newLayer.borderWidth = borderWidth;
	
	return newLayer;
}

@end
