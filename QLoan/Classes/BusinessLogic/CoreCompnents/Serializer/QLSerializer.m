//
//  QLSerializer.m
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLSerializer.h"
#import <EKObjectMapping.h>

@implementation QLSerializer

- (NSDictionary *)dictionaryFromBorrowerOrder:(QLBorrowerOrder *)borrowerOrder {
	return [EKSerializer serializeObject:borrowerOrder
							 withMapping:[self.mappingProvider borrowerOrderMapping]];
}

- (NSDictionary *)dictionaryFromLenderOrder:(QLLenderOrder *)lenderOrder {
	return [EKSerializer serializeObject:lenderOrder
							 withMapping:[self.mappingProvider lenderOrderMapping]];
}

@end
