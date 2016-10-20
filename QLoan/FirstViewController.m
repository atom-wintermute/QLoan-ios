//
//  FirstViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "FirstViewController.h"

#import "QLServicesAssembly.h"

#import "QLAuthViewController.h"

@interface FirstViewController ()

@property (nonatomic) BOOL isUserAuthorized;

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.isUserAuthorized && NO) {
        UIStoryboard *authStoryboard = [UIStoryboard storyboardWithName:@"Auth"
                                                                bundle:[NSBundle mainBundle]];
        UIViewController *authViewController = [authStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([QLAuthViewController class])];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:authViewController];
        [self presentViewController:navigationController
                            animated:NO
                          completion:^{
                              self.isUserAuthorized = YES;
                          }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
