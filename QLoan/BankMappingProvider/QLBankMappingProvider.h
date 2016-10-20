//
//  QLBankMappingProvider.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKObjectMapping;

@interface QLBankMappingProvider : NSObject

+ (EKObjectMapping *)bankUserInfo;

@end
