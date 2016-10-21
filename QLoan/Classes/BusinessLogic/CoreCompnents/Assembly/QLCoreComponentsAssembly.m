//
//  QLCoreComponentsAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>
#import "QLCoreComponentsAssembly.h"

#import "QLBankAuthRequestFactoryImplementation.h"
#import "QLChallengedNetworkClient.h"

#import "QLSerializer.h"

@implementation QLCoreComponentsAssembly

#pragma mark - Маппинг

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

#pragma mark - Сериализаторы

- (QLJSONSerializer *)jsonSerializer {
	return [TyphoonDefinition withClass:[QLJSONSerializer class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(responseSerializer)
									  with:[AFJSONResponseSerializer new]];
			}];
	
}

- (QLSerializer *)serializer {
	return [TyphoonDefinition withClass:[QLSerializer class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(mappingProvider)
									  with:[self mappingProvider]];
			}];
}

#pragma mark - Фабрики запросов

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

- (id<QLBankAuthRequestFactory>)bankAuthRequestFactory {
    return [TyphoonDefinition withClass:[QLBankAuthRequestFactoryImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(requestSerializer)
                                                    with:[AFHTTPRequestSerializer new]];
                          }];
}

#pragma mark - Сетевой клиент

- (QLNetworkClient *)networkClient {
    return [TyphoonDefinition withClass:[QLNetworkClient class]
                          configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(session)
                                      with:[self session]];
            }];
}


- (QLChallengedNetworkClient *)challengedNetworkClient {
	return [TyphoonDefinition withClass:[QLChallengedNetworkClient class]];
}

#pragma mark - Хранилище данных

- (id<QLStorage>)keychainStorage {
    return [TyphoonDefinition withClass:[QLKeychainStorage class]];
}

#pragma mark - Приватные методы

- (NSURLSession *)session {
	return [NSURLSession sharedSession];
}

@end
