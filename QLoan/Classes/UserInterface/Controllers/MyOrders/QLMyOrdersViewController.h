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

@interface QLMyOrdersViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<QLMyOrdersCellFactory> cellFactory;
@property (nonatomic, strong) QLPersonalCabinetService *personalCabinetService;
@property (nonatomic, strong) QLUserInfoService *userInfoService;

@end
