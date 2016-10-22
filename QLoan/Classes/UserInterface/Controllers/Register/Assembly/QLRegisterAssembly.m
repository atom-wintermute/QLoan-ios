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

@implementation QLRegisterAssembly

- (QLRegisterViewController *)registerViewController {
    return [TyphoonDefinition withClass:[QLRegisterViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
                          }];
}

@end
