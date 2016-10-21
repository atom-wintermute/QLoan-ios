//
//  QLCreateBorrowerOrderAssembly.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLCreateBorrowerOrderViewController;

/**
 Фабрика для сборки экрана авторизации
 */
@interface QLCreateBorrowerOrderAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLCreateBorrowerOrderViewController *)createBorrowerOrderViewController;

@end
