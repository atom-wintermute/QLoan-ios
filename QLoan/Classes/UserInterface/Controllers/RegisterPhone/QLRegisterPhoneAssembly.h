//
//  QLRegisterPhoneAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLRegisterPhoneViewContoller;

@interface QLRegisterPhoneAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLRegisterPhoneViewContoller *)registerPhoneViewController;

@end
