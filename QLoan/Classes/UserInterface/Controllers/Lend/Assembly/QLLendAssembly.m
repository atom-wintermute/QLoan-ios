//
//  QLLendAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendAssembly.h"

#import "QLLendViewController.h"
#import "QLServicesAssembly.h"
#import "QLLendCellFactoryImplementation.h"

@implementation QLLendAssembly

- (QLLendViewController *)lendViewController {
    return [TyphoonDefinition withClass:[QLLendViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(cellFactory)
                                                    with:[self lendCellFactory]];
							  [definition injectProperty:@selector(borrowerOrderService)
													with:[self.serviceAssembly borrowerOrderService]];
                          }];
}

#pragma mark - Вспомогательные методы

- (id<QLLendCellFactory>)lendCellFactory {
    return [TyphoonDefinition withClass:[QLLendCellFactoryImplementation class]];
}

@end
