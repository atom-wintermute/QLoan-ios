//
//  QLDateFormatter.h
//  QLoan
//
//  Created by m.rakhmanov on 21.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLDateFormatter : NSObject

- (NSString *)stringFromDate:(NSDate *)date;

- (NSDate *)dateFromString:(NSString *)string;

@end
