//
//  QLAuthViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAuthViewController.h"

static NSString * const QLAuthRegisterSegue = @"registerSegue";

@implementation QLAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)forgetPasswordButtonWasPressed:(id)sender {
    
}

- (void)loginButtonWasPressed:(id)sender {
    
}

- (void)registerButtonWasPressed:(id)sender {
    [self performSegueWithIdentifier:QLAuthRegisterSegue
                              sender:self];
}

@end
