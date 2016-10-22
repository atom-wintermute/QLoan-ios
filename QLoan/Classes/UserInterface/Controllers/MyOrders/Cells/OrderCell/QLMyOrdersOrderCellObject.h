//
//  QLMyOrdersOrderCellObject.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Nimbus/NimbusModels.h>

#import "QLOrderInfo.h"

@interface QLMyOrdersOrderCellObject : NSObject <NICellObject, NINibCellObject>

@property (nonatomic, strong) NSString *sumString;
@property (nonatomic, strong) NSString *percentString;
@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *statusString;
@property (nonatomic) BOOL  showCheckMark;
@property (nonatomic, strong) QLOrderInfo *orderInfo;

@end
