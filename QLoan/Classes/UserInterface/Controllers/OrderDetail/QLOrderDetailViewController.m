//
//  QLOrderDetailViewController.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOrderDetailViewController.h"
#import "QLGetDataDisplayManager.h"
#import "QLStorage.h"
#import "QLOrderInfo.h"
#import "QLUserInteractionService.h"


@interface QLOrderDetailViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLGetDataDisplayManager *dataDisplayManager;
@property (nonatomic, assign) BOOL requestIsBeingCreated;

@end

@implementation QLOrderDetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view layoutIfNeeded];
	[self configureView];
	[self configureTableView];
	
	if (self.orderInfo.user == nil) {
		self.ratingViewContainer.hidden = YES;
		self.readyToGiveLoanLabel.hidden = YES;
	}
	
	self.nameLabel.text = self.orderInfo.user != nil ? [NSString stringWithFormat:@"%@ %@", self.orderInfo.user.firstName, self.orderInfo.user.lastName] : @"Нет контрагента";
}

- (IBAction)requestLoan:(id)sender {
	if (self.requestIsBeingCreated) {
		return;
	}
	self.requestIsBeingCreated = YES;
	
	QLBooleanCompletion completion = ^(BOOL success, NSError *error) {
		self.requestIsBeingCreated = NO;
		UIAlertController *controller;
		if (success) {
			controller = [UIAlertController successAlertControllerWithTitle:@"Запрос успешно направлен"];
		} else {
			controller = [UIAlertController errorAlertControllerWithTitle:@"Не удалось направить запрос"];
		}
		
		[self presentViewController:controller
						   animated:YES
						 completion:nil];
	};
	
	[self.interactionService requestLoanReceipt:self.orderInfo.user.userId
									 completion:completion];
}

- (IBAction)declineLoan:(id)sender {

}

- (void)configureTableView {
	NSArray *cellObjects = [self.cellFactory detailCellObjectsFromOrderInfo:self.orderInfo];
	
	self.dataDisplayManager = [[QLGetDataDisplayManager alloc] initWithInputData:cellObjects
												 andConversionToCellObjectsBlock:^id(id dataObject) {
													 return dataObject;
												 }];
	
	self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
	self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
														   withBaseDelegate:self];
	
	[self.tableView reloadData];
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
