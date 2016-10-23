//
//  AppRouter.h
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@protocol QLAppRouter <NSObject>

- (void)openViewControllerWithNotification:(NSDictionary *)notification;

@end
