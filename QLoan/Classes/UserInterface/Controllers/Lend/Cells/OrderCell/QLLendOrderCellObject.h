//
//  QLLendOrderCellObject.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Nimbus/NimbusModels.h>

@interface QLLendOrderCellObject : NSObject <NICellObject, NINibCellObject>

@property (nonatomic, strong) NSString *photoNameString;
@property (nonatomic, strong) NSString *ratingString;
@property (nonatomic, strong) NSString *sumString;
@property (nonatomic, strong) NSString *percentString;
@property (nonatomic, strong) NSString *nameString;

@end
