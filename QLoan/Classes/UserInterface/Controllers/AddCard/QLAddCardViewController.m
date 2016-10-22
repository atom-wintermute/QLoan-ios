//
//  QLAddCardViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAddCardViewController.h"

#import "QLBankCardService.h"

#import "CardIO.h"

@interface QLAddCardViewController () <CardIOPaymentViewControllerDelegate>

@end

@implementation QLAddCardViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view layoutIfNeeded];
    [self configureAppearance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preloadCardIO];
}

#pragma mark - IBActions

- (void)dataChanged:(id)sender {
    self.scanCardButton.hidden = !!self.panTextField.text.length;
    
    if (self.panTextField.text.length &&
        self.cvcTextField.text.length &&
        self.expiryTextField.text.length) {
        [self.saveButton activate:YES];
    } else{
        [self.saveButton activate:NO];
    }
}

- (void)scanCardButtonWasPressed:(id)sender {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController
                       animated:YES
                     completion:nil];
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

#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES
                                           completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info
             inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSString *pan1 = [info.cardNumber substringWithRange:NSMakeRange(0, 4)];
    NSString *pan2 = [info.cardNumber substringWithRange:NSMakeRange(4, 4)];
    NSString *pan3 = [info.cardNumber substringWithRange:NSMakeRange(8, 4)];
    NSString *pan4 = [info.cardNumber substringWithRange:NSMakeRange(12, 4)];
    
    self.panTextField.text = [NSString stringWithFormat:@"%@-%@-%@-%@", pan1, pan2, pan3, pan4];
    self.expiryTextField.text = [NSString stringWithFormat:@"%d/%d", (int)info.expiryYear, (int)info.expiryMonth];
    self.cvcTextField.text = info.cvv;
    if (info.cardholderName && info.cardholderName.length) {
        self.nameTextField.text = info.cardholderName;
    } else {
        self.nameTextField.text = @" ";
    }
    self.scanCardButton.hidden = YES;
    [self.saveButton activate:YES];
    
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
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
