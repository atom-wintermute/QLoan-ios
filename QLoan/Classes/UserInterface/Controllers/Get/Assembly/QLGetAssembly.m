//
//  QLGetAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLGetAssembly.h"

#import "QLGetViewController.h"

#import "QLGetCellFactoryImplementation.h"

@implementation QLGetAssembly

- (QLGetViewController *)getViewController {
    return [TyphoonDefinition withClass:[QLGetViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(cellFactory)
                                                    with:[self getCellFactory]];
                          }];
}

#pragma mark - Вспомогательные методы

- (id<QLGetCellFactory>)getCellFactory {
    return [TyphoonDefinition withClass:[QLGetCellFactoryImplementation class]];
}


@end
