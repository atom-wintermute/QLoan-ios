//
//  QLUserInfo.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLUserInfo : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger rating;
@property (nonatomic, assign) float loansTakenAmount;
@property (nonatomic, assign) float loansGivenAmount;
@property (nonatomic, copy) NSURL *avatarURL;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *parentName;

@end
