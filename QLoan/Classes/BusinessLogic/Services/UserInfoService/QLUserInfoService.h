//
//  QLUserInfoService.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QLUserInfo;
@class QLRequestFactory;
@class QLNetworkClient;
@class QLJSONSerializer;
@class QLMapper;
@class QLSerializer;

typedef void(^QLUserInfoCompletionBlock)(QLUserInfo *info, NSError *error);

@interface QLUserInfoService : NSObject

@property (nonatomic, strong) QLNetworkClient *networkClient;
@property (nonatomic, strong) QLJSONSerializer *jsonSerializer;
@property (nonatomic, strong) QLSerializer *serializer;
@property (nonatomic, strong) QLMapper *mapper;
@property (nonatomic, strong) QLRequestFactory *requestFactory;

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
