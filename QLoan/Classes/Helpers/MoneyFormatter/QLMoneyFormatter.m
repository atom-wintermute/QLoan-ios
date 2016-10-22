//
//  QLMoneyFormatter.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMoneyFormatter.h"

static NSUInteger const QLNumberFormatterHelperThousandDigitCount = 3;
static NSUInteger const QLNumberFormatterHelperMaximumFractionDigitCount = 2;

static NSString * const QLNumberFormatterHelperDefaultKey = @"default";
static NSString * const QLNumberFormatterHelperMoneyKey = @"money";

@implementation QLMoneyFormatter

#pragma mark - Методы интерфейса

+ (NSString *)numberStringForMoneyFromValue:(NSNumber *)value {
    NSNumberFormatter *formatter = [self formatterForKey:QLNumberFormatterHelperMoneyKey];
    return [formatter stringFromNumber:value];
}

#pragma mark - Приватные методы

+ (NSNumberFormatter *)formatterForKey:(NSString *)key {
    NSCache *numberFormatterCache = [self numberFormatterCache];
    NSNumberFormatter *numberFormatter = [numberFormatterCache objectForKey:key];
    if (!numberFormatter) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        numberFormatter.groupingSize = QLNumberFormatterHelperThousandDigitCount;
        numberFormatter.groupingSeparator = @" ";
        numberFormatter.locale = [NSLocale systemLocale];
        
        if ([QLNumberFormatterHelperDefaultKey isEqualToString:key]) {
            numberFormatter.positivePrefix = @"+";
        } else if ([QLNumberFormatterHelperMoneyKey isEqualToString:key]) {
            numberFormatter.decimalSeparator = @",";
            numberFormatter.maximumFractionDigits = QLNumberFormatterHelperMaximumFractionDigitCount;
        }
        
        [numberFormatterCache setObject:numberFormatter
                                 forKey:key];
    }
    return numberFormatter;
}

+ (NSCache *)numberFormatterCache {
    static NSCache *dateFormatterCache;
    if (!dateFormatterCache) {
        dateFormatterCache = [[NSCache alloc] init];
    }
    return dateFormatterCache;
}

@end
