//
//  QLProfileViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankAuthService;
@protocol QLProfileCellFactory;

/**
 Экран профиля
 */
@interface QLProfileViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<QLBankAuthService> bankAuthService;
@property (nonatomic, strong) id<QLProfileCellFactory> cellFactory;

@end
