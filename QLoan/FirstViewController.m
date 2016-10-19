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

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIStoryboard *authStoryboard = [UIStoryboard storyboardWithName:@"Auth"
                                                            bundle:[NSBundle mainBundle]];
    UIViewController *authViewController = [authStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([QLAuthViewController class])];
    [self presentViewController:authViewController
                        animated:NO
                      completion:nil];
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
