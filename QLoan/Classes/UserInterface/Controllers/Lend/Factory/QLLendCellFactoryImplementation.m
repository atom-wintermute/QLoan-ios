//
//  QLLendCellFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendCellFactoryImplementation.h"

#import "QLLendOrderCellObject.h"

@implementation QLLendCellFactoryImplementation

- (NSArray *)cellObjects {
    NSMutableArray *cellObjects = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < 14; ++i) {
        QLLendOrderCellObject *cellObject = [QLLendOrderCellObject new];
        [cellObjects addObject:cellObject];
    }
    
    return [cellObjects copy];
}

@end
