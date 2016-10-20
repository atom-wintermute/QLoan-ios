//
//  QLTestAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 17.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLTestAssembly.h"
#import "FirstViewController.h"
#import "QLServicesAssembly.h"

@interface QLTestAssembly ()

@property (nonatomic, strong) QLServicesAssembly *servicesAssembly;

@end

@implementation QLTestAssembly

- (FirstViewController *)firstViewController {
	return [TyphoonDefinition withClass:[FirstViewController class]
						  configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(service)
							  with:[self.servicesAssembly borrowerOrderService]];
		[definition injectProperty:@selector(authorizationService)
							  with:[self.servicesAssembly authorizationService]];
	}];
}

@end
