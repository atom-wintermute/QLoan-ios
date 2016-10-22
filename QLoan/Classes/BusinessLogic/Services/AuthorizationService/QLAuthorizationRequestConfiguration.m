//
//  QLAuthorizationRequestConfiguration.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLAuthorizationRequestConfiguration.h"

@implementation QLAuthorizationRequestConfiguration

- (instancetype)initWithLogin:(NSString *)login
					 password:(NSString *)password {
	self = [super init];
	if (self) {
		_login = login;
		_password = password;
	}
	
	return self;
}

@end
