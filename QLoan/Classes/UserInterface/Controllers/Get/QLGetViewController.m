//
//  QLGetViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLGetViewController.h"

#import "QLGetDataDisplayManager.h"

#import "QLGetCellFactory.h"

@interface QLGetViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLGetDataDisplayManager *dataDisplayManager;

@end

@implementation QLGetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Получить займ";
    [self configureView];
}

- (void)configureView {
    [self.view layoutIfNeeded];
    
    NSArray *cellObjects = [self.cellFactory cellObjects];
    self.dataDisplayManager =  [[QLGetDataDisplayManager alloc] initWithInputData:cellObjects
                                                  andConversionToCellObjectsBlock:^id(id dataObject) {
                                                      return dataObject;
                                                  }];
    
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:self];
    [self.tableView reloadData];
}

@end
