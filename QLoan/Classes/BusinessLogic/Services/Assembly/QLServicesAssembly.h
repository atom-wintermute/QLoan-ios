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

/**
 Фабрика сервисов
 */
@interface QLServicesAssembly : TyphoonAssembly

- (QLBorrowerOrderService *)borrowerOrderService;

- (id<QLBankAuthService>)bankAuthService;

@end
