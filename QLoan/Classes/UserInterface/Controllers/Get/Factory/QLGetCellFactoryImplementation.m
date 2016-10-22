//
//  QLGetCellFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLGetCellFactoryImplementation.h"
#import "QLOrderInfo.h"
#import "QLLendOrderCellObject.h"

@implementation QLGetCellFactoryImplementation

- (NSArray *)cellObjects {
    NSMutableArray *cellObjects = [NSMutableArray new];
    
    for (NSUInteger i = 1; i < 20; ++i) {
        QLLendOrderCellObject *cellObject = [QLLendOrderCellObject new];
        cellObject.photoNameString = [NSString stringWithFormat:@"img_%d", (int)i];
        
        NSUInteger rating1 = arc4random_uniform(10);
        NSUInteger rating2 = arc4random_uniform(10);
        cellObject.ratingString = [NSString stringWithFormat:@"%d.%d", (int)rating1, (int)rating2];
        
        NSUInteger percent1 = arc4random_uniform(10);
        NSUInteger percent2 = arc4random_uniform(10);
        NSString *percentSymbol = @"%";
        cellObject.percentString = [NSString stringWithFormat:@"%d.%d%@ в месяц", (int)percent1, (int)percent2, percentSymbol];
        
        NSUInteger sum1 = arc4random_uniform(20);
        cellObject.sumString = [NSString stringWithFormat:@"%d ₽ /", (int)sum1 * 1000];
        
        [cellObjects addObject:cellObject];
    }
    
    return [cellObjects copy];
}

- (NSArray *)cellObjectsFromOrderInfos:(NSArray *)orderInfos {
	NSMutableArray *cellObjects = [NSMutableArray new];
	NSUInteger index = 0;
	
	for (QLOrderInfo *orderInfo in orderInfos) {
		QLLendOrderCellObject *cellObject = [QLLendOrderCellObject new];
		cellObject.photoNameString = [NSString stringWithFormat:@"img_%d", (int)index];
		cellObject.ratingString = [NSString stringWithFormat:@"%ld", (long)orderInfo.user.rating];
		cellObject.sumString = [NSString stringWithFormat:@"%ld ₽", (long)orderInfo.order.loanAmount];
		cellObject.percentString = [NSString stringWithFormat:@"%f%@ в месяц", orderInfo.order.percentage];
		
		[cellObjects addObject:cellObject];
	}
	
	return [cellObjects copy];
}

@end
