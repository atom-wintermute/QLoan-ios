//
//  QLSerializer.h
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QLBorrowerOrder;
@class QLDateFormatter;
@class QLMappingProvider;
@class QLPaymentCompletedRequestConfiguration;

@interface QLSerializer : NSObject

@property (nonatomic, strong) QLMappingProvider *mappingProvider;
@property (nonatomic, strong) QLDateFormatter *dateFormatter;

- (NSDictionary *)dictionaryFromBorrowerOrder:(QLBorrowerOrder *)borrowerOrder;

- (NSDictionary *)dictionaryFromLenderOrder:(QLLenderOrder *)lenderOrder;

- (NSDictionary *)dictionaryFromPaymentCompleted:(QLPaymentCompletedRequestConfiguration *)configuration;

@end
