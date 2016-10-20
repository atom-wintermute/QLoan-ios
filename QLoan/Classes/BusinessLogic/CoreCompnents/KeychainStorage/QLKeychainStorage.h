//
//  QLKeychainStorage.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLStorage.h"

@interface QLKeychainStorage : NSObject <QLStorage>

- (NSString *)tokenForCurrentUser;

- (void)setTokenForCurrentUser:(NSString *)token;

@end
