//
//  QLTabBarController.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLTabBarController : UITabBarController

- (void)showLoginScreen:(BOOL)animated;

- (void)selectTabWithIndex:(NSUInteger)index;

@end
