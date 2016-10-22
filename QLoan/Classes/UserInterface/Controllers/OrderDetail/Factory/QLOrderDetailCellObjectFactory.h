//
//  QLOrderDetailCellObjectFactory.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QLOrderInfo;

@interface QLOrderDetailCellObjectFactory : NSObject

- (NSArray *)detailCellObjectsFromOrderInfo:(QLOrderInfo *)orderInfo;

@end
