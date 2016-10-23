//
//  QLFacebookLoginViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLFacebookLoginViewController.h"

#import "QLBankAuthService.h"

#import "QLBankUserInfo.h"

@interface QLFacebookLoginViewController ()

@end

@implementation QLFacebookLoginViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Авторизация соц.сети";
    
    [self configurAppearance];
}

#pragma mark - IBActions

- (void)continueWithCurrentUser:(id)sender {
    [self.bankAuthService addFacebookEntire];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelButtonWasPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Приватные методы

- (void)configurAppearance {
    QLBankUserInfo *userInfo = [self.bankAuthService obtainCurrentUserData];
    NSString *continueButtonTitle = [NSString stringWithFormat:@"Продолжить как %@", userInfo.firstName];
    [self.continueButton setTitle:continueButtonTitle
                         forState:UIControlStateNormal];
    if (userInfo.avatar) {
        self.photoImageView.image = [UIImage imageWithData:userInfo.avatar];
    }
}

@end
