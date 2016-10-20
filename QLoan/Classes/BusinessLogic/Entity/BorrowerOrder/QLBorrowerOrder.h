//
//  QLBorrowerOrder.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EntityConstants.h"

@interface QLBorrowerOrder : NSObject

@property (nonatomic, assign) NSInteger borrowerId;
@property (nonatomic, assign) NSInteger lenderId;
@property (nonatomic, assign) NSInteger loanMaturityPeriod;
@property (nonatomic, assign) float loanAmount;
@property (nonatomic, assign) float perecentage;
@property (nonatomic, assign) float penalty;
@property (nonatomic, assign) QLRepaymentType repaymentType;
@property (nonatomic, assign) QLBorrowerOrderStatus status;

@end
