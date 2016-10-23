//
//  QLUserInteractionService.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLUserInteractionService.h"

#import "QLRequestFactory.h"
#import "QLNetworkClient.h"
#import "QLMapper.h"
#import "QLJSONSerializer.h"
#import "QLServerResponse.h"
#import "QLSerializer.h"

@implementation QLUserInteractionService

- (void)requestLoanProvision:(NSInteger)orderId
				  completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForLoanProvision:orderId];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)requestLoanReceipt:(NSInteger)orderId 
				completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForLoanReceipt:orderId];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)confirmLoan:(NSInteger)orderId
		 completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForLoanConfirmation:orderId];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)provideLoan:(NSInteger)orderId
		 borrowerId:(NSInteger)borrowerId
		 completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory provideLoanRequest:orderId
							 borrowerId:borrowerId];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)returnLoan:(NSInteger)orderId
		borrowerId:(NSInteger)borrowerId
		completion:(QLBooleanCompletion)completion {
	NSURLRequest *request = [self.requestFactory finishLoanRequest:orderId
							 borrowerId:borrowerId];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)completePayment:(QLPaymentCompletedRequestConfiguration *)configuration
			 completion:(QLRatingIncreaseCompletion)completion {
	NSDictionary *parameters = [self.serializer dictionaryFromPaymentCompleted:configuration];
	NSURLRequest *request = [self.requestFactory requestForPaymentCompletion:parameters];
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		if (error == nil) {
			run_block_on_main(completion, YES, nil);
		} else {
			run_block_on_main(completion, NO, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

@end
