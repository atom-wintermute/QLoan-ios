//
//  QLPersonalCabinetService.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLPersonalCabinetService.h"
#import "QLRequestFactory.h"
#import "QLNetworkClient.h"
#import "QLMapper.h"
#import "QLJSONSerializer.h"
#import "QLServerResponse.h"
#import "QLSerializer.h"


@implementation QLPersonalCabinetService

- (void)myLenderOrdersWithPage:(NSInteger)page
					sortMethod:(QLSortMethod)sortMethod
					 ascending:(BOOL)ascending
					completion:(QLLendersOrderCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForMyLenderOrdersWithPage:page
																	   sortMethod:sortMethod
																		ascending:ascending];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			id responseObject = [strongSelf.jsonSerializer jsonObjectFromResponse:response];
			NSArray *orders = [strongSelf.mapper mapLenderOrdersFromResponseObject:responseObject];
			run_block_on_main(completion, orders, nil);
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)myBorrowerOrdersWithPage:(NSInteger)page
					  sortMethod:(QLSortMethod)sortMethod
					   ascending:(BOOL)ascending
					  completion:(QLBorrowersOrderCompletion)completion {
	NSURLRequest *request = [self.requestFactory requestForMyBorrowerOrdersWithPage:page
																		 sortMethod:sortMethod
																		  ascending:ascending];
	__weak typeof (self) weakSelf = self;
	
	QLNetworkCompletion networkCompletion = ^(QLServerResponse *response, NSError *error) {
		__strong typeof (self) strongSelf = weakSelf;
		if (error == nil) {
			id responseObject = [strongSelf.jsonSerializer jsonObjectFromResponse:response];
			NSArray *orders = [strongSelf.mapper mapBorrowerOrdersFromResponseObject:responseObject];
			run_block_on_main(completion, orders, nil);
		} else {
			run_block_on_main(completion, nil, error);
		}
	};
	
	[self.networkClient sendRequest:request
						 completion:networkCompletion];
}

- (void)myNotificationsWithPage:(NSInteger)page
					 completion:(QLNotificationsCompletion)completion {
	
}

- (void)myNotificationWithId:(NSInteger)notificationId
				  completion:(QLNotificationCompletion)completion {
	
}

- (void)myPaymentsWithOrderId:(NSInteger)orderId
				   completion:(QLPaymentScheduleCompletion)completion {
	
}

- (void)deactivateMyOrder:(NSInteger)orderId
			   completion:(QLBooleanCompletion)completion {
	
}


@end
