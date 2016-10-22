//
//  QLFacebookLoginAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLFacebookLoginViewController;

@interface QLFacebookLoginAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLFacebookLoginViewController *)facebookLoginViewController;

@end
