//
//  QLProfileAssembly.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Typhoon/Typhoon.h>

@class QLServicesAssembly;
@class QLProfileViewController;

@interface QLProfileAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) QLServicesAssembly *serviceAssembly;

- (QLProfileViewController *)profileViewController;

@end
