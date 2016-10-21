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
	
	CALayer *border = [CALayer layer];
	CGFloat borderWidth = 0.5;
	border.borderColor = [UIColor darkGrayColor].CGColor;
	border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height);
	border.borderWidth = borderWidth;
	[self.layer addSublayer:border];
	self.layer.masksToBounds = YES;
}

@end
