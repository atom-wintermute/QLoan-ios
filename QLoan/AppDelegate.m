//
//  AppDelegate.m
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AppDelegate.h"

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
			 [QLCoreComponentsAssembly class],
			 [QLServicesAssembly class],
			 [QLTestAssembly class],
             [QLAuthAssembly class],
             [QLProfileAssembly class],
             [QLLendAssembly class],
             [QLGetAssembly class],
			 [QLCreateBorrowerOrderAssembly class],
			 [QLCreateLenderOrderAssembly class],
             [QLMyOrdersAssembly class],
             [QLRegisterPhoneAssembly class],
             [QLVerifyPhoneAssembly class],
             [QLRegisterAssembly class]
			 ];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

#pragma maik - Push Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[PushNotificationManager pushManager] handlePushRegistration:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[PushNotificationManager pushManager] handlePushRegistrationFailure:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[PushNotificationManager pushManager] handlePushReceived:userInfo];
}

#pragma mark - PushNotificationDelegate

- (void) onPushAccepted:(PushNotificationManager *)pushManager
       withNotification:(NSDictionary *)pushNotification
                onStart:(BOOL)onStart {
    
}

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
