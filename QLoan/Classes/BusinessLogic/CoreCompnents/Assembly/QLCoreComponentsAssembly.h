//
//  QLCoreComponentsAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>

#import "QLMapper.h"
#import "QLMappingProvider.h"
#import "QLJSONSerializer.h"
#import "QLRequestFactory.h"
#import "QLJSONSerializer.h"
#import "QLKeychainStorage.h"
#import "QLNetworkClient.h"

@interface QLCoreComponentsAssembly : TyphoonAssembly

- (QLMapper *)mapper;

- (QLMappingProvider *)mappingProvider;

- (QLJSONSerializer *)jsonSerializer;

- (QLRequestFactory *)requestFactory;

- (QLNetworkClient *)networkClient;

@end
