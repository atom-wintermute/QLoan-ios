//
//  QLCreateLenderOrderAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLCreateLenderOrderViewController;

/**
 Фабрика для сборки экрана авторизации
 */
@interface QLCreateLenderOrderAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLCreateLenderOrderViewController *)createLenderOrderViewController;

@end
