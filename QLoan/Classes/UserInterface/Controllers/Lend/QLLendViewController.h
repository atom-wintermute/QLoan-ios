//
//  QLLendViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLLendCellFactory;

@class QLBorrowerOrderService;

@interface QLLendViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (strong, nonatomic) QLBorrowerOrderService *borrowerOrderService;
@property (nonatomic, strong) id<QLLendCellFactory> cellFactory;

@end
