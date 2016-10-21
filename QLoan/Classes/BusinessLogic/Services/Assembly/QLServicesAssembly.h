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

@class QLBorrowerOrderService;
@class QLAuthorizationService;
@class QLLenderOrderService;

/**
 Фабрика сервисов
 */
@interface QLServicesAssembly : TyphoonAssembly

- (QLBorrowerOrderService *)borrowerOrderService;

- (QLLenderOrderService *)lenderOrderService;

- (QLAuthorizationService *)authorizationService;

- (id<QLBankAuthService>)bankAuthService;

@end
