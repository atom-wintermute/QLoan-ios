//
//  QLFacebookLoginAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLFacebookLoginAssembly.h"

#import "QLServicesAssembly.h"

#import "QLFacebookLoginViewController.h"

@implementation QLFacebookLoginAssembly

- (QLFacebookLoginViewController *)facebookLoginViewController {
    return [TyphoonDefinition withClass:[QLFacebookLoginViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
                          }];
}

@end
