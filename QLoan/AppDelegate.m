//
//  AppDelegate.m
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AppDelegate.h"

#import "QLAppRouter.h"

#import <Pushwoosh/PushNotificationManager.h>

#import "QLCoreComponentsAssembly.h"
#import "QLServicesAssembly.h"
#import "QLTestAssembly.h"
#import "QLAuthAssembly.h"
#import "QLProfileAssembly.h"
#import "QLLendAssembly.h"
#import "QLGetAssembly.h"
#import "QLMyOrdersAssembly.h"
#import "QLRegisterPhoneAssembly.h"
#import "QLVerifyPhoneAssembly.h"
#import "QLRegisterAssembly.h"
#import "QLCreateBorrowerOrderAssembly.h"
#import "QLCreateLenderOrderAssembly.h"
#import "QLAddCardAssembly.h"
#import "ApplicationAssembly.h"
#import "QLOrderDetailAssembly.h"
#import "QLFacebookLoginAssembly.h"

#import <RamblerTyphoonUtils/AssemblyCollector.h>

@interface AppDelegate () <PushNotificationDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAppearance];
    [self configurePushWooshWithOptions:launchOptions];
//    [self activateAssemblies];
    
    return YES;
}

- (NSArray *)initialAssemblies {
	return @[
			 [ApplicationAssembly class],
			 [QLCoreComponentsAssembly class],
			 [QLServicesAssembly class],
			 [QLTestAssembly class],
             [QLAuthAssembly class],
             [QLProfileAssembly class],
             [QLLendAssembly class],
             [QLGetAssembly class],
			 [QLCreateBorrowerOrderAssembly class],
			 [QLCreateLenderOrderAssembly class],
			 [QLOrderDetailAssembly class],
             [QLMyOrdersAssembly class],
             [QLRegisterPhoneAssembly class],
             [QLVerifyPhoneAssembly class],
             [QLRegisterAssembly class],
             [QLAddCardAssembly class],
             [QLFacebookLoginAssembly class]
			 ];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}

#pragma maik - Push Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	[self.storage storeObject:deviceToken
					   forKey:@"pushToken"];
    NSLog(@"device token = %@", deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [self.appRouter openViewControllerWithNotification:userInfo];
}

#pragma mark - PushNotificationDelegate



#pragma mark - Приватные методы

- (void)configureAppearance {
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:ARFontLight size:16.0]}];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
	[[UINavigationBar appearance] setTintColor:[UIColor ql_turquoiseColor]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage new]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage new]];
}

- (void)configurePushWooshWithOptions:(NSDictionary *)launchOptions {
    PushNotificationManager * pushManager = [PushNotificationManager pushManager];
    pushManager.delegate = self;
    
    // handling push on app start
    [[PushNotificationManager pushManager] handlePushReceived:launchOptions];
    
    // make sure we count app open in Pushwoosh stats
    [[PushNotificationManager pushManager] sendAppOpen];
    
    // register for push notifications!
    [[PushNotificationManager pushManager] registerForPushNotifications];
	[self.storage storeObject:[[PushNotificationManager pushManager] getPushToken]
					   forKey:@"pushToken"];
    NSLog(@"push token = %@", [[PushNotificationManager pushManager] getPushToken]);
}

- (void)activateAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    NSMutableArray *classes = [[collector collectInitialAssemblyClasses] mutableCopy];
    NSMutableArray *assemblies = [NSMutableArray arrayWithCapacity:classes.count];
    TyphoonAssembly *assembly = [classes.firstObject new];
    [classes removeObjectAtIndex:0];
    
    for (Class assemblyClass in classes) {
        id assembly = [assemblyClass new];
        [assemblies addObject:assembly];
    }
    
    //В текущей реализации глобальные TyphoonConfig не работают
    TyphoonComponentFactory *factory = (TyphoonComponentFactory *)[assembly activateWithCollaboratingAssemblies:assemblies];
    [TyphoonComponentFactory setFactoryForResolvingUI:factory];
    [factory inject:self];
}

@end
