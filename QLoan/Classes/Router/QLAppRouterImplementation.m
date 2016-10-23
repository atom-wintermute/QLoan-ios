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
	
	QLNotificationCompletion completion = ^(QLNotification *notification, NSError *error) {
		if (!error) {
			
		}
	};
	
	[self.personalCabinetService myNotificationWithId:[notificationId integerValue]
										   completion:completion];
	
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    UIViewController *rootViewController = [mainWindow rootViewController];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Вам пришло уведомление"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Открыть уведомление"
                                                     style:UIAlertActionStyleDefault
												   handler:^(UIAlertAction *action){
													  
												   }];
    [alertController addAction:action];
    
    [rootViewController presentViewController:alertController
                                     animated:YES
                                   completion:nil];
}

@end
