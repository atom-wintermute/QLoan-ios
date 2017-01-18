//
//  NSMutableArray+RDSNilFilter.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 16/06/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "NSMutableArray+RDSNilFilter.h"

@implementation NSMutableArray (RDSNilFilter)

- (void)rds_addNonNilObject:(id)object {
    if (object != nil) {
        [self addObject: object];
    }
}

- (void)rds_insertNonNilObject:(id)object atIndex: (NSUInteger)index {
    if (object != nil) {
        [self insertObject: object atIndex: index];
    }
}

- (void)rds_addObjectsFromNonEmptyArray:(NSArray *)array {
    if (array.count > 0) {
        [self addObjectsFromArray:array];
    }
}

- (void)rds_addString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]] && string.length != 0) {
        [self addObject:string];
    }
}

@end