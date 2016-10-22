//
//  AppDelegate.h
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLStorage;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id<QLStorage> storage;

- (NSArray *)initialAssemblies;

@end

