//
//  QLPaymentSchedule.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QLPayment;

@interface QLPaymentSchedule : NSObject

@property (nonatomic, strong) NSArray<QLPayment *> *payments;
@property (nonatomic, assign) float penalty;
@property (nonatomic, assign) float indebtedness;

@end
