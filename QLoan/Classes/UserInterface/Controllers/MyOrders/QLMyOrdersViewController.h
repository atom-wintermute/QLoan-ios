//
//  QLMyOrdersViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLMyOrdersCellFactory;
@class QLPersonalCabinetService;
@class QLUserInfoService;
@class QLAppRouterImplementation;

@interface QLMyOrdersViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIView *emptyView;

@property (nonatomic, strong) id<QLMyOrdersCellFactory> cellFactory;
@property (nonatomic, strong) QLPersonalCabinetService *personalCabinetService;
@property (nonatomic, strong) QLUserInfoService *userInfoService;
@property (nonatomic, strong) QLAppRouterImplementation *router;

@end
