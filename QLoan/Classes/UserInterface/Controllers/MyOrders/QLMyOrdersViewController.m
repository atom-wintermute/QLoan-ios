//
//  QLMyOrdersViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersViewController.h"

#import "QLMyOrdersCellFactory.h"

#import "QLMyOrdersDataDisplayManager.h"
#import "QLMyOrdersEmptyDataView.h"
#import "ALView+PureLayout.h"

@interface QLMyOrdersViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLMyOrdersDataDisplayManager *dataDisplayManager;

@end

@implementation QLMyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view layoutIfNeeded];
    self.navigationItem.title = @"Мои заявки";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showData];
}

#pragma mark - Приватные методы

- (void)showData {
    NSArray *cellObjects = [self.cellFactory cellObjects];
    cellObjects = @[];
    if (cellObjects.count) {
        self.dataDisplayManager =  [[QLMyOrdersDataDisplayManager alloc] initWithInputData:cellObjects
                                                           andConversionToCellObjectsBlock:^id(id dataObject) {
                                                               return dataObject;
                                                           }];
    
        self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
        self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                               withBaseDelegate:self];
    } else {
        /*
        QLMyOrdersEmptyDataView *emptyView = [QLMyOrdersEmptyDataView new];
        emptyView.backgroundColor = [UIColor redColor];
        [self.tableView addSubview:emptyView];
        [emptyView autoPinEdgesToSuperviewEdges];
         */
    }
    [self.tableView reloadData];
}


@end
