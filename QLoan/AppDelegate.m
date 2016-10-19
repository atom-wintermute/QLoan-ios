//
//  AppDelegate.m
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AppDelegate.h"
#import "QLCoreComponentsAssembly.h"
#import "QLServicesAssembly.h"
#import "QLTestAssembly.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAppearance];
    
    return YES;
}

- (NSArray *)initialAssemblies {
	return @[
			 [QLCoreComponentsAssembly class],
			 [QLServicesAssembly class],
			 [QLTestAssembly class]
			 ];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage new]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage new]];
}

@end
