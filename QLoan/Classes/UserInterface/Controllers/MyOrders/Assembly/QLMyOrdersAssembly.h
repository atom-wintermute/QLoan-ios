//
//  QLMyOrdersAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLMyOrdersViewController;
@class QLServicesAssembly;
@class QLCoreComponentsAssembly;

@interface QLMyOrdersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *servicesAssembly;
@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;

- (QLMyOrdersViewController *)myOrdersController;

@end
