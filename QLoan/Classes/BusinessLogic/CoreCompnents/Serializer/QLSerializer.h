//
//  QLSerializer.h
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLMappingProvider.h"

@class QLBorrowerOrder;

@interface QLSerializer : NSObject

@property (nonatomic, strong) QLMappingProvider *mappingProvider;

- (NSDictionary *)dictionaryFromBorrowerOrder:(QLBorrowerOrder *)borrowerOrder;

@end
