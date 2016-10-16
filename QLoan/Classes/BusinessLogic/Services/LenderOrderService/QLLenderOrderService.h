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

@interface QLLenderOrderService : NSObject

/**
 Метод getLendersOrders
 */
- (void)lenderOrdersWithPage:(NSInteger)page
				  sortMethod:(QLSortMethod)sortMethod
				   ascending:(BOOL)ascending
				  completion:(QLLendersOrderCompletion)completion;

/**
 Метод getLenderOrder
 */
- (void)lenderOrderWithId:(NSInteger)orderId
			   completion:(QLLenderOrderCompletion)completion;

/**
 Метод addLenderOrder
 */
- (void)addLenderOrder:(QLLenderOrder *)order
			completion:(QLBooleanCompletion)completion;

@end
