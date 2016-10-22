//
//  QLGetViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLGetCellFactory;

@class QLBorrowerOrderService;

/**
 Контроллер получения займа
 */
@interface QLGetViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<QLGetCellFactory> cellFactory;

@end
