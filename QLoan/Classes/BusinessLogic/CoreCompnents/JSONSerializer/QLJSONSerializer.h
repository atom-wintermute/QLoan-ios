//
//  QLJsonSerializer.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFURLResponseSerialization.h>
#import "QLServerResponse.h"

@interface QLJSONSerializer : NSObject

@property (nonatomic, strong) AFHTTPResponseSerializer *responseSerializer;

- (id)jsonObjectFromResponse:(QLServerResponse *)response;

@end
