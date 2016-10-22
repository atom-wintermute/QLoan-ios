//
//  QLOrderDetailViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOrderDetailViewController.h"
#import "QLStorage.h"
#import "QLOrderInfo.h"

@implementation QLOrderDetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view layoutIfNeeded];
	[self configureView];
}

- (IBAction)requestLoan:(id)sender {

}

- (IBAction)declineLoan:(id)sender {

}

- (void)configureView {
	
	self.photoImage.image = [UIImage imageNamed:self.orderInfo.photoInfo];
	self.photoImage.layer.cornerRadius = CGRectGetWidth(self.photoImage.frame) / 2;
	self.photoImage.layer.masksToBounds = YES;
	
	CALayer *ratingLayer = self.fakeImageView.layer;
	
	ratingLayer.masksToBounds = NO;
	ratingLayer.shadowColor = [UIColor ql_shadowColor].CGColor;
	ratingLayer.shadowOffset = CGSizeMake(0.0, 5.0);
	ratingLayer.shadowRadius = 6.0;
	ratingLayer.shadowOpacity = 0.96;
	ratingLayer.shadowPath = [UIBezierPath bezierPathWithRect:self.fakeImageView.bounds].CGPath;
}

@end
