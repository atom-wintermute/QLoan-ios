//
//  QLSortMethodParser.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesConstants.h"

@interface QLSortMethodParser : NSObject

+ (NSString *)descriptionFromSortMethod:(QLSortMethod)sortMethod;

+ (NSString *)descriptionFromSortOrdering:(BOOL)ascending;

+ (QLSortMethod)sortMethodFromDescription:(NSString *)description;

+ (BOOL)ascendingSortOrderingFromDescription:(NSString *)description;

@end
