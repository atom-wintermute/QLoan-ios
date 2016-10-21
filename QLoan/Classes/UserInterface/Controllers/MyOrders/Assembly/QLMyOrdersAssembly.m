//
//  QLMyOrdersAssembly.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersAssembly.h"

#import "QLMyOrderViewController.h"

@implementation QLMyOrdersAssembly

- (QLMyOrderViewController *)myOrdersController {
    return [TyphoonDefinition withClass:[QLMyOrderViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                          }];
}

@end
