//
//  UIAlertController+Extensions.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extensions)

+ (UIAlertController *)standartErrorAlertController;

+ (UIAlertController *)errorAlertControllerWithTitle:(NSString *)title;

@end
