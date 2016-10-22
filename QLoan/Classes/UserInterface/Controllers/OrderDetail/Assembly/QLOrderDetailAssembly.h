//
//  QLOrderDetailAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLAuthViewController;
@class QLCoreComponentsAssembly;
@class QLOrderDetailViewController;

/**
 Фабрика для сборки экрана авторизации
 */
@interface QLOrderDetailAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;
@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;

- (QLOrderDetailViewController *)orderDetailViewController;

@end
