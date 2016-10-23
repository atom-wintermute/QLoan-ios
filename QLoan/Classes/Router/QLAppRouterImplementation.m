//
//  QLAppRouterImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAppRouterImplementation.h"

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
    
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    UIViewController *rootViewController = [mainWindow rootViewController];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Вам пришло уведомление"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Открыть уведомление"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alertController addAction:action];
    
    [rootViewController presentViewController:alertController
                                     animated:YES
                                   completion:nil];
}

@end
