//
//  QLServicesAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 17.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>

@protocol QLBankAuthService;
@protocol QLBankCardService;

@class QLBorrowerOrderService;
@class QLAuthorizationService;
@class QLLenderOrderService;
@class QLUserInteractionService;
@class QLPersonalCabinetService;
@class QLUserInfoService;

/**
 Фабрика сервисов
 */
@interface QLServicesAssembly : TyphoonAssembly

- (QLPersonalCabinetService *)personalCabinetService;

- (QLBorrowerOrderService *)borrowerOrderService;

- (QLLenderOrderService *)lenderOrderService;

- (QLUserInteractionService *)interactionService;

- (QLAuthorizationService *)authorizationService;

- (QLUserInfoService *)userInfoService;

- (id<QLBankAuthService>)bankAuthService;

- (id<QLBankCardService>)bankCardService;

@end
