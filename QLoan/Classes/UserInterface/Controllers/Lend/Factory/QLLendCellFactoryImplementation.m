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
    
    for (NSUInteger i = 1; i < 14; ++i) {
        QLLendOrderCellObject *cellObject = [QLLendOrderCellObject new];
        cellObject.photoNameString = [NSString stringWithFormat:@"img%d", (int)i];
        
        NSUInteger rating1 = arc4random_uniform(10);
        NSUInteger rating2 = arc4random_uniform(10);
        cellObject.ratingString = [NSString stringWithFormat:@"%d.%d", (int)rating1, (int)rating2];
        
        NSUInteger percent1 = arc4random_uniform(10);
        NSUInteger percent2 = arc4random_uniform(10);
        NSString *percentSymbol = @"%";
        cellObject.percentString = [NSString stringWithFormat:@"%d.%d%@ в месяц", (int)percent1, (int)percent2, percentSymbol];
        
        NSUInteger sum1 = arc4random_uniform(20);
        NSString *formattedString = [QLMoneyFormatter numberStringForMoneyFromValue:@(sum1 * 1000)];
        cellObject.sumString = [NSString stringWithFormat:@"%@ ₽ /", formattedString];
        
        [cellObjects addObject:cellObject];
    }
    
    return [cellObjects copy];
}

@end
