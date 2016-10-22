//
//  QLRegisterAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegisterAssembly.h"

#import "QLServicesAssembly.h"
#import "QLRegisterViewController.h"
#import "QLCoreComponentsAssembly.h"

@implementation QLRegisterAssembly

- (QLRegisterViewController *)registerViewController {
    return [TyphoonDefinition withClass:[QLRegisterViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
							  [definition injectProperty:@selector(authorizationService)
													with:[self.serviceAssembly authorizationService]];
							  [definition injectProperty:@selector(storage)
													with:[self.coreAssembly inMemoryStorage]];

                          }];
}

@end
