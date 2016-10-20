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

/**
 Фабрика для сборки экрана авторизации
 */
@interface QLAuthAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLAuthViewController *)authViewController;

@end
