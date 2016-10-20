//
//  QLJsonSerializer.m
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLJsonSerializer.h"

@implementation QLJSONSerializer

- (id)jsonObjectFromResponse:(QLServerResponse *)response {
	return [self.responseSerializer responseObjectForResponse:response.response
														 data:response.data
														error:nil];
}

@end
