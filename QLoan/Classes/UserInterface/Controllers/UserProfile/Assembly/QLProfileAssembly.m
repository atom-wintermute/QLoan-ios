//
//  QLProfileAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileAssembly.h"

#import "QLServicesAssembly.h"

#import "QLProfileViewController.h"
#import "QLProfileCellFactoryImplementation.h"

@implementation QLProfileAssembly

- (QLProfileViewController *)profileViewController {
    return [TyphoonDefinition withClass:[QLProfileViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bankAuthService)
                                                    with:[self.serviceAssembly bankAuthService]];
                              [definition injectProperty:@selector(cellFactory)
                                                    with:[self profileCellFactory]];
                          }];
}

#pragma mark - Вспомогательные методы

- (id<QLProfileCellFactory>)profileCellFactory {
    return [TyphoonDefinition withClass:[QLProfileCellFactoryImplementation class]];
}

@end
