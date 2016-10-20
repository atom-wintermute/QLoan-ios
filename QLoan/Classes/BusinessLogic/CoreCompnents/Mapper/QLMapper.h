//
//  QLMapper.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLMappingProvider.h"
#import "QLSessionCredentials.h"

@interface QLMapper : NSObject

@property (nonatomic, strong) QLMappingProvider *mappingProvider;

- (QLBorrowerOrder *)mapBorrowerOrderFromResponseObject:(id)responseObject;

- (QLSessionCredentials *)mapSessionCredentialsFromResponseObject:(id)responseObject;

@end
