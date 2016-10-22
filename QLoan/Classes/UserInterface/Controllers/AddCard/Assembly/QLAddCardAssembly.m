//
//  QLAddCardAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAddCardAssembly.h"

#import "QLServicesAssembly.h"
#import "QLAddCardViewController.h"

@implementation QLAddCardAssembly

- (QLAddCardViewController *)addCardViewController {
    return [TyphoonDefinition withClass:[QLAddCardViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankCardService)
                                                    with:[self.serviceAssembly bankCardService]];
                              
                          }];
}

@end
