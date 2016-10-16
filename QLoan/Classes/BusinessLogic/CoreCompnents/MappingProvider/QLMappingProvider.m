//
//  QLMappingProvider.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMappingProvider.h"

@implementation QLMappingProvider

- (EKObjectMapping *)borrowerOrderMapping {
	return [EKObjectMapping mappingForClass:[QLBorrowerOrder class] withBlock:^(EKObjectMapping *mapping) {
	}];
}

@end
