//
//  QLLenderOrderService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServicesConstants.h"
#import "QLLenderOrderService.h"

@class QLLenderOrder;
@class QLBorrowerOrder;
@class QLRequestFactory;
@class QLNetworkClient;
@class QLJSONSerializer;
@class QLMapper;
@class QLSerializer;

@interface QLLenderOrderService : NSObject

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) QLJSONSerializer *jsonSerializer;
@property (nonatomic, strong) QLSerializer *serializer;
@property (nonatomic, strong) QLMapper *mapper;
@property (nonatomic, strong) QLRequestFactory *requestFactory;

/**
 Метод getLendersOrders
 */
- (void)lenderOrdersWithPage:(NSInteger)page
				  sortMethod:(QLSortMethod)sortMethod
				   ascending:(BOOL)ascending
				  completion:(QLBorrowersOrderCompletion)completion;

/**
 Метод getLenderOrder
 */
- (void)lenderOrderWithId:(NSInteger)orderId
			   completion:(QLBorrowerOrderCompletion)completion;

/**
 Метод addLenderOrder
 */
- (void)addLenderOrder:(QLBorrowerOrder *)order
			completion:(QLBooleanCompletion)completion;

@end
