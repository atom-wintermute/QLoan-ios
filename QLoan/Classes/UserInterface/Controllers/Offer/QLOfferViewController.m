//
//  QLOfferViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOfferViewController.h"

@interface QLOfferViewController ()

@end

@implementation QLOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view layoutIfNeeded];
    [self configureAppearance];
}

#pragma mark - IBActions

- (void)continueButtonWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.continueButton addGradient];
}

@end
