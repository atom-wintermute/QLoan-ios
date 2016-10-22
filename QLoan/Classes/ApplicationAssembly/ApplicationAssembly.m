//
//  ApplicationAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "QLCoreComponentsAssembly.h"

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate {
	return [TyphoonDefinition withClass:[AppDelegate class]
									   configuration:^(TyphoonDefinition *definition) {
										   [definition injectProperty:@selector(storage)
																 with:[self.coreAssembly inMemoryStorage]];
									   }];
}

@end
