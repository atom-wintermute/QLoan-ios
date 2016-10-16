//
//  EntityConstants.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QLRepaymentType) {
	QLMonthly = 0,
	QLOnce
};

typedef NS_ENUM(NSUInteger, QLBorrowerOrderStatus) {
	QLBorrowerOrderStatusActive = 0,
	QLBorrowerOrderStatusRequested,
	QLBorrowerOrderStatusAccepted,
	QLBorrowerOrderStatusStarted,
	QLBorrowerOrderStatusFinished
};

typedef NS_ENUM(NSUInteger, QLLenderOrderStatus) {
	QLLenderOrderStatusActive = 0,
	QLLenderOrderStatusRequested,
	QLLenderOrderStatusStarted,
	QLLenderOrderStatusFinished
};

typedef NS_ENUM(NSUInteger, QLNotificationType) {
	QLNotificationTypePaymentDue = 0,
	QLNotificationTypeLoanProvisionRequested,
	QLNotificationTypeLoanReceiptRequested,
	QLNotificationTypeLoanConfirmed,
	QLNotificationTypeLoanProvided,
	QLNotificationTypePaymentSent,
	QLNotificationTypePaymentReceived
};

typedef NS_ENUM(NSUInteger, QLPaymentStatus) {
	QLPaymentStatusDue = 0,
	QLPaymentStatusCompleted
};

