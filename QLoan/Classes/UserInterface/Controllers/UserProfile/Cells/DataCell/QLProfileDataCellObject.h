//
//  QLProfileDataCellObject.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Nimbus/NimbusModels.h>

@interface QLProfileDataCellObject : NSObject <NICellObject, NINibCellObject>

@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *valueString;

@end
