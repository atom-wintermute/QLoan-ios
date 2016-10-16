//
//  QLUserInfoService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QLUserInfo;

typedef void(^QLUserInfoCompletionBlock)(QLUserInfo *info, NSError *error);

@interface QLUserInfoService : NSObject

/**
 Метод currentUser
 */
- (void)infoForCurrentUserWithCompletion:(QLUserInfoCompletionBlock)completion;

/**
 Метод getUserById
 */
- (void)infoForUserWithId:(NSInteger)userId
			   completion:(QLUserInfoCompletionBlock)completion;

@end
