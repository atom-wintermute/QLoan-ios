//
//  QLOrderStatusParser.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesConstants.h"
#import "EntityConstants.h"

@interface QLOrderStatusParser : NSObject

+ (NSString *)descriptionFromBorrowerStatus:(QLBorrowerOrderStatus)status;

+ (QLBorrowerOrderStatus)statusFromDescription:(NSString *)description;

@end
