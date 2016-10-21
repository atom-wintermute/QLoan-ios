//
//  QLCoreComponentsAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>

@protocol QLBankAuthMapper;

#import "QLMapper.h"
#import "QLMappingProvider.h"
#import "QLJSONSerializer.h"
#import "QLRequestFactory.h"
#import "QLBankAuthRequestFactory.h"
#import "QLJSONSerializer.h"
#import "QLKeychainStorage.h"
#import "QLNetworkClient.h"

@interface QLCoreComponentsAssembly : TyphoonAssembly

#pragma mark - Маппинг

- (QLMapper *)mapper;

- (QLMappingProvider *)mappingProvider;

- (id<QLBankAuthMapper>)bankAuthMapper;

#pragma mark - Сериализаторы

- (QLJSONSerializer *)jsonSerializer;

#pragma mark - Фабрики запросов

- (QLRequestFactory *)requestFactory;

- (id<QLBankAuthRequestFactory>)bankAuthRequestFactory;

#pragma mark - Хранилище данных

- (id<QLStorage>)keychainStorage;

- (id<QLStorage>)inMemoryStorage;

#pragma mark - Сетевой клиент

- (QLNetworkClient *)networkClient;

@end
