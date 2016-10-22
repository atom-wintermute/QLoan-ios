//
//  QLMyOrdersAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersAssembly.h"

#import "QLMyOrdersViewController.h"
#import "QLServicesAssembly.h"
#import "QLMyOrdersCellFactoryImplementation.h"

@implementation QLMyOrdersAssembly

- (QLMyOrdersViewController *)myOrdersController {
    return [TyphoonDefinition withClass:[QLMyOrdersViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(cellFactory)
                                                    with:[self myOrdersCellFactory]];
							  [definition injectProperty:@selector(personalCabinetService)
													with:[self.servicesAssembly personalCabinetService]];
							  [definition injectProperty:@selector(userInfoService)
													with:[self.servicesAssembly userInfoService]];
                          }];
}

#pragma mark - Вспомогательные методы

- (id<QLMyOrdersCellFactory>)myOrdersCellFactory {
    return [TyphoonDefinition withClass:[QLMyOrdersCellFactoryImplementation class]];
}

@end
