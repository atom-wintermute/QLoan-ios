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
#import "QLBankAuthRequestFactory.h"
#import "QLJSONSerializer.h"
#import "QLKeychainStorage.h"
#import "QLNetworkClient.h"
#import "QLChallengedNetworkClient.h"
#import "QLSerializer.h"
#import "QLDateFormatter.h"

@interface QLCoreComponentsAssembly : TyphoonAssembly

#pragma mark - Маппинг

- (QLMapper *)mapper;

- (QLMappingProvider *)mappingProvider;

#pragma mark - Сериализаторы

- (QLJSONSerializer *)jsonSerializer;

- (QLSerializer *)serializer;

#pragma mark - Фабрики запросов

- (QLRequestFactory *)requestFactory;

- (id<QLBankAuthRequestFactory>)bankAuthRequestFactory;

#pragma mark - Сетевой клиент

- (QLNetworkClient *)networkClient;

- (QLChallengedNetworkClient *)challengedNetworkClient;

#pragma mark - Хранилище данных

- (id<QLStorage>)keychainStorage;

@end
