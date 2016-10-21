//
//  QLLendAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendAssembly.h"

#import "QLLendViewController.h"

@implementation QLLendAssembly

- (QLLendViewController *)lendViewController {
    return [TyphoonDefinition withClass:[QLLendViewController class]
                          configuration:^(TyphoonDefinition *definition) {
//                              [definition injectProperty:@selector(bankAuthService)
//                                                    with:[self.serviceAssembly bankAuthService]];
//                              [definition injectProperty:@selector(bankCardService)
//                                                    with:[self.serviceAssembly bankCardService]];
//                              [definition injectProperty:@selector(cellFactory)
//                                                    with:[self profileCellFactory]];
                          }];
}

#pragma mark - Вспомогательные методы

//- (id<QLProfileCellFactory>)profileCellFactory {
//    return [TyphoonDefinition withClass:[QLProfileCellFactoryImplementation class]];
//}

@end
