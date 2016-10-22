//
//  QLProfileAddCardCellObject.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Nimbus/NimbusModels.h>

@protocol QLProfileViewDelegate;

@interface QLProfileAddCardCellObject : NSObject <NICellObject, NINibCellObject>

@property (nonatomic, weak) id<QLProfileViewDelegate> delegate;

@end
