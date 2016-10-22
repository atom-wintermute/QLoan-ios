//
//  QLRegisterPhoneAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegisterPhoneAssembly.h"

#import "QLServicesAssembly.h"
#import "QLRegisterPhoneViewContoller.h"
#import "QLCoreComponentsAssembly.h"

@implementation QLRegisterPhoneAssembly

- (QLRegisterPhoneViewContoller *)registerPhoneViewController {
    return [TyphoonDefinition withClass:[QLRegisterPhoneViewContoller class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
							  [definition injectProperty:@selector(storage)
													with:[self.coreAssembly inMemoryStorage]];
                          }];
}

@end
