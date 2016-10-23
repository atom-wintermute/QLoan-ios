//
//  ApplicationAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Typhoon/Typhoon.h>
#import "AppDelegate.h"

@class QLCoreComponentsAssembly;
@class QLServicesAssembly;

/**
 Фабрика для сборки экрана авторизации
 */
@interface ApplicationAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;
@property (nonatomic, strong, readonly) QLServicesAssembly *servicesAssembly;

- (AppDelegate *)appDelegate;

@end
