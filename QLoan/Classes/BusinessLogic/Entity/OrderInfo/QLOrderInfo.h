//
//  QLOrderInfo.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLBorrowerOrder.h"
#import "QLUserInfo.h"

@interface QLOrderInfo : NSObject

@property (nonatomic, strong) QLBorrowerOrder *order;
@property (nonatomic, strong) QLUserInfo *user;
@property (nonatomic, strong) NSString *photoInfo;

@end
