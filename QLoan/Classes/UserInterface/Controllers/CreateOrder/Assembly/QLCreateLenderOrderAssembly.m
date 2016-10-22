//
//  QLCreateLenderOrderAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLCreateLenderOrderViewController.h"
#import "QLCreateLenderOrderAssembly.h"
#import "QLServicesAssembly.h"

@implementation QLCreateLenderOrderAssembly

- (QLCreateLenderOrderViewController *)createLenderOrderViewController {
	return [TyphoonDefinition withClass:[QLCreateLenderOrderViewController class]
						  configuration:^(TyphoonDefinition *definition) {
							  [definition injectProperty:@selector(lenderOrderService)
													with:[self.serviceAssembly lenderOrderService]];
						  }];
}

@end
