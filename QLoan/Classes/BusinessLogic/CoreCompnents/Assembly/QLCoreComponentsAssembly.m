//
//  QLCoreComponentsAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>
#import "QLCoreComponentsAssembly.h"

@implementation QLCoreComponentsAssembly

- (QLMapper *)mapper {
	return [TyphoonDefinition withClass:[QLMapper class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(mappingProvider)
									  with:[self mappingProvider]];
			}];
}

- (QLMappingProvider *)mappingProvider {
	return [TyphoonDefinition withClass:[QLMappingProvider class]];
}

- (QLJSONSerializer *)jsonSerializer {
	return [TyphoonDefinition withClass:[QLJSONSerializer class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(responseSerializer)
									  with:[AFJSONResponseSerializer new]];
			}];
	
}

- (QLNetworkClient *)networkClient {
	return [TyphoonDefinition withClass:[QLNetworkClient class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(session)
									  with:[self session]];
			}];
}

- (QLRequestFactory *)requestFactory {
	return [TyphoonDefinition withClass:[QLRequestFactory class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(requestSerializer)
									  with:[AFHTTPRequestSerializer new]];
				[definition injectProperty:@selector(keychainStorage)
									  with:[self keychainStorage]];
			}];
}

- (QLKeychainStorage *)keychainStorage {
	return [TyphoonDefinition withClass:[QLKeychainStorage class]];
}

- (NSURLSession *)session {
	return [NSURLSession new];
}

@end
