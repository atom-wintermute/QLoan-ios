//
//  FirstViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLBorrowerOrderService.h"
#import "QLAuthorizationService.h"

@interface FirstViewController : UIViewController

@property (nonatomic, strong) QLBorrowerOrderService *service;
@property (nonatomic, strong) QLAuthorizationService *authorizationService;

@end

