//
//  QLVerifyPhoneAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLVerifyPhoneAssembly.h"

#import "QLServicesAssembly.h"
#import "QLVerifyPhoneViewController.h"
#import "QLCoreComponentsAssembly.h"

@implementation QLVerifyPhoneAssembly

- (QLVerifyPhoneViewController *)verifyPhoneViewController {
    return [TyphoonDefinition withClass:[QLVerifyPhoneViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
							  [definition injectProperty:@selector(storage)
													with:[self.coreAssembly inMemoryStorage]];
                          }];
}

@end
