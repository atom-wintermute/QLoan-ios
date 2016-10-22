//
//  QLRegisterAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLRegisterViewController;
@class QLCoreComponentsAssembly;

@interface QLRegisterAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;
@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;

- (QLRegisterViewController *)registerViewController;

@end
