//
//  QLLendViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendViewController.h"

#import "QLLendCellFactory.h"

#import "QLLendDataDisplayManager.h"

@interface QLLendViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLLendDataDisplayManager *dataDisplayManager;

@end

@implementation QLLendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)configureView {
    [self.view layoutIfNeeded];
    
    NSArray *cellObjects = [self.cellFactory cellObjects];
    self.dataDisplayManager =  [[QLLendDataDisplayManager alloc] initWithInputData:cellObjects
                                                   andConversionToCellObjectsBlock:^id(id dataObject) {
                                                       return dataObject;
                                                   }];
    
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:self];
    [self.tableView reloadData];
}

@end
