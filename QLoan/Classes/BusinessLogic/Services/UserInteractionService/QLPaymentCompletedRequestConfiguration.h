//
//  QLPaymentCompletedRequestConfiguration.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLPaymentCompletedRequestConfiguration : NSObject

@property (nonatomic, assign) NSInteger orderId;
@property (nonatomic, assign) float amount;
@property (nonatomic, copy) NSDate *date;

@end
