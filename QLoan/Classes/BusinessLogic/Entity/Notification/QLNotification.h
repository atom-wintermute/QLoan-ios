//
//  QLNotification.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EntityConstants.h"

@interface QLNotification : NSObject

@property (nonatomic, assign) NSInteger notificaitonId;
@property (nonatomic, assign) NSInteger orderId;
@property (nonatomic, assign) NSInteger borrowerId;
@property (nonatomic, assign) NSInteger lenderId;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, assign) QLNotificationType type;
@property (nonatomic, copy) NSString *content;

@end
