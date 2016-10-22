//
//  QLAddCardViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAddCardViewController.h"

#import "QLBankCardService.h"

@interface QLAddCardViewController ()

@end

@implementation QLAddCardViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view layoutIfNeeded];
    [self configureAppearance];
}

#pragma mark - IBActions

- (void)dataChanged:(id)sender {
    if (self.panTextField.text.length &&
        self.cvcTextField.text.length &&
        self.expiryTextField.text.length) {
        [self.saveButton activate:YES];
    } else{
        [self.saveButton activate:NO];
    }
}

- (void)saveButtonWasPressed:(id)sender {
    NSString *panString = self.panTextField.text;
    NSString *cvcString = self.cvcTextField.text;
    NSString *expiryString = self.expiryTextField.text;
    NSString *mnemonicString = @"Новая карта";
    
    @weakify(self);
    [self.bankCardService addCardWithPan:panString
                                     cvc:cvcString
                              expiryDate:expiryString
                            mnemonicName:mnemonicString
                              completion:^(BOOL success, NSError *error) {
                                  @strongify(self);
                                  if (success) {
                                      [self updateCardInfo];
                                  }
                              }];
}

#pragma mark - Приватные методы

- (void)updateCardInfo {
    [self.bankCardService updateBankCardsWithCompletion:^(NSArray<QLBankCard *> *cards, NSError *error) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)configureAppearance {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    self.navigationItem.title = @"Добавить карту";
    
    [self.saveButton activate:NO];
}

@end
