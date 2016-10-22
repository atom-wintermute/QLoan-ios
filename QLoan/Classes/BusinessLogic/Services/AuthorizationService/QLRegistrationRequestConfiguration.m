//
//  QLRegistrationRequestConfiguration.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLRegistrationRequestConfiguration.h"

@implementation QLRegistrationRequestConfiguration

- (instancetype)initWithLogin:(NSString *)login
					 password:(NSString *)password
					firstName:(NSString *)firstName
					 lastName:(NSString *)lastName
				   parentName:(NSString *)parentName {
	self = [super init];
	if (self) {
		_lastName = lastName;
		_password = password;
		_firstName = firstName;
		_lastName = lastName;
		_parentName = parentName;
	}
	
	return self;
}

@end
