//
//  QLAppRouterImplementation.h
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLAppRouter.h"
#import "QLPersonalCabinetService.h"
#import "QLBorrowerOrderService.h"
#import "QLUserInfoService.h"

@interface QLAppRouterImplementation : NSObject <QLAppRouter>

@property (nonatomic, strong) UIWindow *mainWindow;
@property (nonatomic, strong) QLPersonalCabinetService *personalCabinetService;
@property (nonatomic, strong) QLBorrowerOrderService *borrowerOrderService;
@property (nonatomic, strong) QLUserInfoService *userInfoService;

@end
