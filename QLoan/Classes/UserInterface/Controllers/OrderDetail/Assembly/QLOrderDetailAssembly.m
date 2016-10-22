//
//  QLOrderDetailAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOrderDetailAssembly.h"
#import "QLOrderDetailViewController.h"
#import "QLServicesAssembly.h"
#import "QLCoreComponentsAssembly.h"
#import "QLOrderDetailCellObjectFactory.h"

@implementation QLOrderDetailAssembly

- (QLOrderDetailViewController *)orderDetailViewController {
	return [TyphoonDefinition withClass:[QLOrderDetailViewController class]
						  configuration:^(TyphoonDefinition *definition) {
							  [definition injectProperty:@selector(storage)
													with:[self.coreAssembly inMemoryStorage]];
							  [definition injectProperty:@selector(cellFactory)
													with:[QLOrderDetailCellObjectFactory new]];
							  [definition injectProperty:@selector(interactionService)
													with:[self.serviceAssembly interactionService]];
						  }];
}

@end
