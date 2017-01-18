//
//  QLAuthAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLAuthViewController;
@class QLCoreComponentsAssembly;

/**
 Фабрика для сборки экрана авторизации
 */
@interface QLAuthAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;
@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;

- (QLAuthViewController *)authViewController;

@end
