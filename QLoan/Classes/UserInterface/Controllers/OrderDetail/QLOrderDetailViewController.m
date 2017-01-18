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
#import "QLPersonalCabinetService.h"

#import "QLRatingModalViewController.h"

@interface QLOrderDetailViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLGetDataDisplayManager *dataDisplayManager;
@property (nonatomic, assign) BOOL requestIsBeingCreated;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *notificationId;
@property (nonatomic, assign) QLOrderAction orderAction;


@end

@implementation QLOrderDetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view layoutIfNeeded];
	[self configureView];
	[self configureTableView];
	
	if (self.navigationController != nil) {
		self.crossButton.hidden = YES;
	}
	
	self.userId = [self.storage credentialsForCurrentUser].userId;
	
	if (self.orderInfo.user == nil) {
		self.ratingViewContainer.hidden = YES;
		self.readyToGiveLoanLabel.hidden = YES;
	}
	
	self.nameLabel.text = self.orderInfo.user != nil ? [NSString stringWithFormat:@"%@ %@", self.orderInfo.user.firstName, self.orderInfo.user.lastName] : @"Нет контрагента";
	
	QLOrderAction action = QLDoNothing;
	if (self.userId == self.orderInfo.order.borrowerId) {
		switch (self.orderInfo.order.status) {
			case QLBorrowerOrderStatusActive:
				action = QLDoNothing;
				break;
			case QLBorrowerOrderStatusRequested:
				action = QLDoNothing;
				break;
			case QLBorrowerOrderStatusStarted:
				action = QLSendRepaymentToLender;
				break;
			case QLBorrowerOrderStatusFinished:
				action = QLDoNothing;
				break;
		}
	} else if (self.userId == self.orderInfo.order.lenderId) {
		switch (self.orderInfo.order.status) {
			case QLBorrowerOrderStatusActive:
				action = QLDoNothing;
				break;
			case QLBorrowerOrderStatusRequested:
				action = QLSendPaymentToBorrower;
				break;
			case QLBorrowerOrderStatusStarted:
				action = QLDoNothing;
				break;
			case QLBorrowerOrderStatusFinished:
				action = QLDoNothing;
				break;
		}
	} else {
		action = QLSendRequestToLender;
	}
	[self determineConfiguration:action];
}

- (IBAction)requestLoan:(id)sender {
	if (self.requestIsBeingCreated) {
		return;
	}
	self.requestIsBeingCreated = YES;
	
	QLBooleanCompletion completion = ^(BOOL success, NSError *error) {
		self.requestIsBeingCreated = NO;
		
		switch (self.orderAction) {
            case QLDoNothing: {
                UIAlertController *controller;
                if (success) {
                    controller = [UIAlertController successAlertControllerWithTitle:@"Запрос успешно направлен"
                                                                         completion:^{
                                                                             [self.navigationController popViewControllerAnimated:YES];
                                                                         }];
                } else {
                    controller = [UIAlertController errorAlertControllerWithTitle:@"Не удалось направить платеж"];
                }
                
                [self presentViewController:controller
                                   animated:YES
                                 completion:nil];
            }
			case QLSendPaymentToBorrower: {
				UIAlertController *controller;
				if (success) {
					controller = [UIAlertController successAlertControllerWithTitle:@"Платеж успешно переведен"
																		 completion:^{
																			 if (self.navigationController)
																			 [self.navigationController popViewControllerAnimated:YES];
																			 else {
																				 [self dismissViewControllerAnimated:YES completion:nil];
																			 }
																		 }];
					
				} else {
					controller = [UIAlertController errorAlertControllerWithTitle:@"Платеж успешно переведен"];
				}
				
				[self presentViewController:controller
								   animated:YES
								 completion:nil];
				return;
			}
			case QLSendRepaymentToLender:{
				[self showIncreaseRatingScreen];
				return;
			}
			case QLSendRequestToLender:{
				UIAlertController *controller;
				if (success) {
					controller = [UIAlertController successAlertControllerWithTitle:@"Запрос успешно направлен"
																		 completion:^{
																			 [self.navigationController popViewControllerAnimated:YES];
																		 }];
				} else {
					controller = [UIAlertController errorAlertControllerWithTitle:@"Не удалось направить платеж"];
				}
				
				[self presentViewController:controller
								   animated:YES
								 completion:nil];
				return;
			}
		}
	};
	
	switch (self.orderAction) {
		case QLDoNothing:
            [self.interactionService requestLoanReceipt:self.orderInfo.order.orderId
                                             completion:completion];
			break;
		case QLSendPaymentToBorrower:
			[self.interactionService provideLoan:self.orderInfo.order.orderId
									  borrowerId:self.orderInfo.user.userId
									  completion:completion];
			
			break;
		case QLSendRepaymentToLender:
			[self.interactionService returnLoan:self.orderInfo.order.orderId
									 borrowerId:self.userId
									 completion:completion];
			break;
		case QLSendRequestToLender:
			[self.interactionService requestLoanReceipt:self.orderInfo.order.orderId
											 completion:completion];
			break;
	}
}

- (IBAction)declineLoan:(id)sender {
    
}
- (IBAction)closeWindow:(id)sender {
	[self dismissViewControllerAnimated:YES
							 completion:nil];
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
	self.photoImage.image = self.userId == self.orderInfo.order.lenderId ? [UIImage imageNamed:@"sasha.jpg"] : [UIImage imageNamed:@"tema.jpg"];
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

- (void)determineConfiguration:(QLOrderAction)action {
	switch (action) {
		case QLDoNothing:
			[self.requestButton setTitle:@"Запросить займ" forState:UIControlStateNormal];
			self.declineButton.hidden = YES;
			break;
		case QLSendPaymentToBorrower:
			[self.requestButton setTitle:@"Выдать займ" forState:UIControlStateNormal];
			[self.declineButton setTitle:@"Отклонить" forState:UIControlStateNormal];
			break;
		case QLSendRepaymentToLender:
			[self.requestButton setTitle:@"Вернуть займ" forState:UIControlStateNormal];
			self.declineButton.hidden = YES;
			break;
		case QLSendRequestToLender:
			[self.requestButton setTitle:@"Запросить займ" forState:UIControlStateNormal];
			self.declineButton.hidden = YES;
			break;
	}
	self.orderAction = action;
//	if (self.notificationId != nil) {
//		QLNotificationCompletion completion = ^(QLNotification *notification, NSError *error) {
//			
//		};
//		
//		[self.personalCabinetService myNotificationWithId:[self.notificationId integerValue]
//											   completion:completion];
//	}
}

- (void)showIncreaseRatingScreen {
    
    QLRatingModalViewController *modal = [QLRatingModalViewController new];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    modal.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:modal
                       animated:YES
                     completion:nil];
}

@end
