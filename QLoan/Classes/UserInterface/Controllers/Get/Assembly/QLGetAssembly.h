//
//  QLGetAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLGetViewController;

@interface QLGetAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLGetViewController *)lendViewController;

@end
