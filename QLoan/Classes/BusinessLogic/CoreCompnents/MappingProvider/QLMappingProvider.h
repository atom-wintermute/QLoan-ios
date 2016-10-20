//
//  QLMappingProvider.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>

#import "QLBorrowerOrder.h"

@interface QLMappingProvider : NSObject

- (EKObjectMapping *)borrowerOrderMapping;

- (EKObjectMapping *)authorizationHeaderMapping;

@end
