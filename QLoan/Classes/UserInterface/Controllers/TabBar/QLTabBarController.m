//
//  QLTabBarController.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLTabBarController.h"

#import "QLServicesAssembly.h"

#import "QLAuthViewController.h"
#import "QLRegistrationRequestConfiguration.h"

@interface QLTabBarController ()

@property (nonatomic) BOOL isUserAuthorized;

@end

@implementation QLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.isUserAuthorized) {
        [self showLoginScreen:NO];
    }
}

#pragma mark - Методы интерфейса

- (void)showLoginScreen:(BOOL)animated {
    UIStoryboard *authStoryboard = [UIStoryboard storyboardWithName:@"Auth"
                                                             bundle:[NSBundle mainBundle]];
    UIViewController *authViewController = [authStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([QLAuthViewController class])];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:authViewController];
    [self presentViewController:navigationController
                       animated:animated
                     completion:^{
                         self.isUserAuthorized = YES;
                     }];

}

- (void)selectTabWithIndex:(NSUInteger)index {
    self.selectedViewController = self.viewControllers[index];
}

@end
