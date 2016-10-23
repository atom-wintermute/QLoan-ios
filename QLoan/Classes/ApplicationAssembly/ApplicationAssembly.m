//
//  ApplicationAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "ApplicationAssembly.h"

#import "QLCoreComponentsAssembly.h"

#import "QLAppRouterImplementation.h"

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate {
	return [TyphoonDefinition withClass:[AppDelegate class]
									   configuration:^(TyphoonDefinition *definition) {
										   [definition injectProperty:@selector(storage)
																 with:[self.coreAssembly inMemoryStorage]];
                                           [definition injectProperty:@selector(appRouter)
                                                                 with:[self appRouter]];
									   }];
}

#pragma mark - Вспомогательные методы

- (id<QLAppRouter>)appRouter {
    return [TyphoonDefinition withClass:[QLAppRouterImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(mainWindow)
                                                    with:[self mainWindow]];
                          }];
}

- (UIWindow *)mainWindow {
    return [TyphoonDefinition withClass:[UIWindow class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithFrame:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
                                              }];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

@end
