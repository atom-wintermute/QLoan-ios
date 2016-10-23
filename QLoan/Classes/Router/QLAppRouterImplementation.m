//
//  QLAppRouterImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAppRouterImplementation.h"
#import "QLUserInfoService.h"
#import "QLPersonalCabinetService.h"
#import "QLBorrowerOrderService.h"
#import "QLNotification.h"
#import "QLBorrowerOrder.h"
#import "QLUserInfoService.h"
#import "QLOrderInfo.h"
#import "QLOrderDetailViewController.h"

static NSString * const QLNotificationPaymentDue = @"payment_due";
static NSString * const QLNotificationLoanProvisionRequested = @"loan_provision_requested";
static NSString * const QLNotificationLoanReceiptRequested = @"loan_receipt_requested";
static NSString * const QLNotificationLoanConfirmed = @"loan_confirmed";
static NSString * const QLNotificationLoanProvided = @"loan_provided";
static NSString * const QLNotificationPaymentSent = @"payment_sent";
static NSString * const QLNotificationPaymentReceived = @"payment_received";

@implementation QLAppRouterImplementation

- (void)openViewControllerWithNotification:(NSDictionary *)notification {
    NSLog(@"notification = %@", notification);
    NSString *notificationId = notification[@"note_id"];
	NSString *notificationType = notification[@"type"];
	__block QLNotification *globalNotification;
	__block QLBorrowerOrder *globalOrder;
	
	UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
	UIViewController *rootViewController = [mainWindow rootViewController];
	
	QLUserInfoCompletionBlock userInfoCompletion = ^(QLUserInfo *info, NSError *error) {
		if (error) {
			return;
		}
		
		QLOrderInfo *orderInfo = [QLOrderInfo new];
		orderInfo.user = info;
		orderInfo.order = globalOrder;
		
		UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Get"
															 bundle:[NSBundle mainBundle]];
		QLOrderDetailViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"QLOrderDetailViewController"];
		if (controller != nil) {
			controller.orderInfo = orderInfo;
			[rootViewController presentViewController:controller
											 animated:YES
										   completion:nil];
		}
	};
	
	QLBorrowerOrderCompletion borrowerCompletion = ^(QLBorrowerOrder *order, NSError *error) {
		
		if (error) {
			return;
		}
		
		globalOrder = order;
		
		NSInteger userId;
		if ([notificationType isEqualToString:QLNotificationLoanReceiptRequested]) {
			userId = globalNotification.borrowerId;
		} else {
			userId = globalNotification.lenderId;
		}
		[self.userInfoService infoForUserWithId:globalNotification.borrowerId
									 completion:userInfoCompletion];
	};
	
	QLNotificationCompletion completion = ^(QLNotification *notification, NSError *error) {
		if (!error) {
			globalNotification = notification;
			[self.borrowerOrderService borrowerOrderWithId:notification.orderId
												completion:borrowerCompletion];
		}
	};
	
	[self.personalCabinetService myNotificationWithId:[notificationId integerValue]
										   completion:completion];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Вам пришло уведомление"
//                                                                             message:@""
//                                                                      preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Открыть уведомление"
//                                                     style:UIAlertActionStyleDefault
//												   handler:^(UIAlertAction *action){
//													  
//												   }];
//    [alertController addAction:action];
//    
//    [rootViewController presentViewController:alertController
//                                     animated:YES
//                                   completion:nil];
}

@end
