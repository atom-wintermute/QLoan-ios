//
//  QLUserInteractionService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServicesConstants.h"
#import "EntityConstants.h"

@class QLPaymentCompletedRequestConfiguration;

@interface QLUserInteractionService : NSObject

/**
 Метод sendLoanProvideRequest
 */
- (void)requestLoanProvision:(NSInteger)orderId
				  completion:(QLBooleanCompletion)completion;

/**
 Метод sendLoanReceiveRequest
 */
- (void)requestLoanReceipt:(NSInteger)orderId
				completion:(QLBooleanCompletion)completion;

/**
 Метод confirmLoan
 */
- (void)confirmLoan:(NSInteger)orderId
		 completion:(QLBooleanCompletion)completion;

/**
 Метод provideLoan
 */
- (void)provideLoan:(NSInteger)orderId
		 completion:(QLBooleanCompletion)completion;

/**
 Метод paymentCompleted
 */
- (void)completePayment:(QLPaymentCompletedRequestConfiguration *)configuration
			 completion:(QLRatingIncreaseCompletion)completion;

@end
