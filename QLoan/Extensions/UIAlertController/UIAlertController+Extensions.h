//
//  UIAlertController+Extensions.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VoidCompletion)();

@interface UIAlertController (Extensions)

+ (UIAlertController *)standartErrorAlertController;

+ (UIAlertController *)errorAlertControllerWithTitle:(NSString *)title;

+ (UIAlertController *)successAlertControllerWithTitle:(NSString *)title;

+ (UIAlertController *)successAlertControllerWithTitle:(NSString *)title
											completion:(VoidCompletion)completion;

@end
