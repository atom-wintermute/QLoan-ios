//
//  QLMyOrdersCellFactory.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@class QLBorrowerOrder;

@protocol QLMyOrdersCellFactory <NSObject>

- (NSArray *)cellObjects;

- (NSArray *)cellObjectsFromOrders:(NSArray *)orders;

@end
