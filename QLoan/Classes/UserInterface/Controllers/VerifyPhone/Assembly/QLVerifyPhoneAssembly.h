//
//  QLVerifyPhoneAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLVerifyPhoneViewController;
@class QLCoreComponentsAssembly;

@interface QLVerifyPhoneAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;
@property (nonatomic, strong, readonly) QLCoreComponentsAssembly *coreAssembly;

- (QLVerifyPhoneViewController *)verifyPhoneViewController;

@end
