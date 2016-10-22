//
//  QLRegistrationRequestConfiguration.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLRegistrationRequestConfiguration : NSObject

@property (nonatomic, strong) NSData *avatarData;
@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *parentName;

- (instancetype)initWithLogin:(NSString *)login
					 password:(NSString *)password
					firstName:(NSString *)firstName
					 lastName:(NSString *)lastName
				   parentName:(NSString *)parentName;

@end
