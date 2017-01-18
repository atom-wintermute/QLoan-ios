//
//  QLSessionCredentials.h
//  QLoan
//
//  Created by m.rakhmanov on 20.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLSessionCredentials : NSObject

@property (nonatomic, copy) NSString *client;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, assign) NSInteger userId;

@end
