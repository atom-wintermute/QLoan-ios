//
//  QLProfileViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileViewController.h"

#import "QLBankAuthService.h"
#import "QLProfileCellFactory.h"

#import "QLProfileDataDisplayManager.h"

#import "QLBankUserInfo.h"

@interface QLProfileViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLProfileDataDisplayManager *dataDisplayManager;

@end

@implementation QLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

#pragma mark - Приватные методы

- (void)configureView {
    QLBankUserInfo *bankUserInfo = [self.bankAuthService obtainCurrentUserData];
    
    self.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", bankUserInfo.firstName, bankUserInfo.secondName];
    
    
    NSArray *cellObjects = [self.cellFactory cellObjectsFrom:bankUserInfo];
    self.dataDisplayManager =  [[QLProfileDataDisplayManager alloc] initWithInputData:cellObjects
                                                      andConversionToCellObjectsBlock:^id(id dataObject) {
                                                          return dataObject;
                                                      }];
    
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:self];
    [self.tableView reloadData];
}

@end
