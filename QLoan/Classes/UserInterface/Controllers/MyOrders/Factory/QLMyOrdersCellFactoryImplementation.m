//
//  QLMyOrdersCellFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersCellFactoryImplementation.h"

#import "QLMyOrdersCellFactory.h"

#import "QLMyOrdersOrderCellObject.h"

@implementation QLMyOrdersCellFactoryImplementation

- (NSArray *)cellObjects {
    NSMutableArray *cellObjects = [NSMutableArray new];
    
    for (NSUInteger i = 1; i < 14; ++i) {
        QLMyOrdersOrderCellObject *cellObject = [QLMyOrdersOrderCellObject new];
        
        NSUInteger percent1 = arc4random_uniform(10);
        NSUInteger percent2 = arc4random_uniform(10);
        NSString *percentSymbol = @"%";
        cellObject.percentString = [NSString stringWithFormat:@"%d.%d%@ в месяц", (int)percent1, (int)percent2, percentSymbol];
        
        NSUInteger sum1 = arc4random_uniform(20);
        NSString *formattedString = [QLMoneyFormatter numberStringForMoneyFromValue:@(sum1 * 1000)];
        cellObject.sumString = [NSString stringWithFormat:@"%@ ₽ /", formattedString];
        
        cellObject.nameString = @"Олег Евгеньевич Д.";
        
        NSUInteger type = arc4random_uniform(3);
        switch (type) {
            case 0:
                cellObject.statusString = @"Запрос";
                cellObject.showCheckMark = NO;
                break;
            case 1:
                cellObject.statusString = @"Займ выдан";
                cellObject.showCheckMark = YES;
                break;
            case 2:
                cellObject.statusString = @"Займ получен";
                cellObject.showCheckMark = YES;
                break;
            case 3:
                cellObject.statusString = @"Деактивирована";
                cellObject.showCheckMark = NO;
                break;
            default:
                break;
        }
        
        [cellObjects addObject:cellObject];
    }
    
    return [cellObjects copy];
}

@end
