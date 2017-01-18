//
//  QLRatingModalViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRatingModalViewController.h"

@interface QLRatingModalViewController ()

@end

@implementation QLRatingModalViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureAppearance];
}

- (void)closeButtonWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

#pragma mark - Приватные методы

- (void)configureAppearance {
    [self.view layoutIfNeeded];
    
    [self.doneButton addGradient];
}

@end
