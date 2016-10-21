//
//  QLBorrowerOrderService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "ServicesConstants.h"

#import <Foundation/Foundation.h>

@class QLBorrowerOrder;
@class QLRequestFactory;
@class QLNetworkClient;
@class QLJSONSerializer;
@class QLMapper;
@class QLSerializer;

@interface QLBorrowerOrderService : NSObject

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) QLJSONSerializer *jsonSerializer;
@property (nonatomic, strong) QLSerializer *serializer;
@property (nonatomic, strong) QLMapper *mapper;
@property (nonatomic, strong) QLRequestFactory *requestFactory;

/**
 Метод getBorrowersOrders
 */
- (void)borrowerOrdersWithPage:(NSInteger)page
					sortMethod:(QLSortMethod)sortMethod
					 ascending:(BOOL)ascending
					completion:(QLBorrowersOrderCompletion)completion;

/**
 Метод getBorrowersOrder
 */
- (void)borrowerOrderWithId:(NSInteger)orderId
				 completion:(QLBorrowerOrderCompletion)completion;

/**
 Метод addBorrowerOrder
 */
- (void)addBorrowerOrder:(QLBorrowerOrder *)order
			  completion:(QLBooleanCompletion)completion;

@end
