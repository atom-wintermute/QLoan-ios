//
//  QLAuthAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAuthAssembly.h"

#import "QLServicesAssembly.h"
#import "QLCoreComponentsAssembly.h"
#import "QLAuthViewController.h"

@implementation QLAuthAssembly

- (QLAuthViewController *)authViewController {
    return [TyphoonDefinition withClass:[QLAuthViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
                              [definition injectProperty:@selector(bankCardService)
                                                    with:[self.serviceAssembly bankCardService]];
							  [definition injectProperty:@selector(authorizationService)
													with:[self.serviceAssembly authorizationService]];
							  [definition injectProperty:@selector(storage)
													with:[self.coreAssembly inMemoryStorage]];

                          }];
}

@end
