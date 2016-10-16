//
//  QLPayment.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EntityConstants.h"

@interface QLPayment : NSObject

@property (nonatomic, assign) QLPaymentStatus status;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, assign) float amount;

@end
