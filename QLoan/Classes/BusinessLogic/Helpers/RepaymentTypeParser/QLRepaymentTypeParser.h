//
//  QLRepaymentTypeParser.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityConstants.h"

@interface QLRepaymentTypeParser : NSObject

+ (NSString *)descriptionFromRepaymentType:(QLRepaymentType)repaymentType;

+ (QLRepaymentType)repaymentTypeFromDescription:(NSString *)description;

@end
