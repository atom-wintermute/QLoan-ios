//
//  AppDelegate.h
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLStorage;
@protocol QLAppRouter;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) id<QLAppRouter> appRouter;

- (NSArray *)initialAssemblies;

@end

