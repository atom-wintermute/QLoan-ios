//
//  QLMappingProvider.h
//  QLoan
//
//  Created by m.rakhmanov on 16.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>

@class QLDateFormatter;

@interface QLMappingProvider : NSObject

@property (nonatomic, strong) QLDateFormatter *formatter;

- (EKObjectMapping *)borrowerOrderMapping;

- (EKObjectMapping *)lenderOrderMapping;

- (EKObjectMapping *)authorizationHeaderMapping;

- (EKObjectMapping *)notificationMapping;

- (EKObjectMapping *)paymentMapping;

- (EKObjectMapping *)paymentScheduleMapping;

- (EKObjectMapping *)userInfoMapping;

@end
