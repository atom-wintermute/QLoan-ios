//
//  QLCreateBorrowerOrderAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateBorrowerOrderViewController.h"
#import "QLCreateBorrowerOrderAssembly.h"
#import "QLServicesAssembly.h"

@implementation QLCreateBorrowerOrderAssembly

- (QLCreateBorrowerOrderViewController *)createBorrowerOrderViewController {
	return [TyphoonDefinition withClass:[QLCreateBorrowerOrderViewController class]
						  configuration:^(TyphoonDefinition *definition) {
							  [definition injectProperty:@selector(borrowerOrderService)
													with:[self.serviceAssembly borrowerOrderService]];
						  }];
}

@end
