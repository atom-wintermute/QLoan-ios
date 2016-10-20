//
//  QLInMemoryStorage.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLInMemoryStorage.h"

@implementation QLInMemoryStorage

#pragma mark - Свойства

- (NSDictionary *)storageDictionary {
    if (_storageDictionary == nil) {
        _storageDictionary = [NSDictionary new];
    }
    return _storageDictionary;
}

#pragma mark - QLStorage

- (void)storeObject:(id)object forKey:(NSString *)key {
    NSMutableDictionary *tempDictionary = [self.storageDictionary mutableCopy];
    [tempDictionary setValue:object forKey:key];
    self.storageDictionary = tempDictionary;
}

- (id)loadObjectForKey:(NSString *)key {
    return self.storageDictionary[key];
}

- (void)loadObjectForKey:(NSString *)key withCompletion:(void (^)(id))completion {
    id object = [self loadObjectForKey:key];
    run_block(completion, object);
}

- (void)removeObjectForKey:(NSString *)key {
    NSMutableDictionary *tempDictionary = [self.storageDictionary mutableCopy];
    [tempDictionary removeObjectForKey:key];
    self.storageDictionary = tempDictionary;
}

@end
