//
//  QLMyOrdersAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersAssembly.h"

#import "QLMyOrdersViewController.h"

@implementation QLMyOrdersAssembly

- (QLMyOrdersViewController *)myOrdersController {
    return [TyphoonDefinition withClass:[QLMyOrdersViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                          }];
}

@end
