//
//  UIAlertController+Extensions.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "UIAlertController+Extensions.h"


@implementation UIAlertController (Extensions)

+ (UIAlertController *)standartErrorAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Сервер не отвечает"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    UIAlertAction *repeatAction = [UIAlertAction actionWithTitle:@"Повторить"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
    [alertController addAction:repeatAction];
    
    return alertController;
}

+ (UIAlertController *)errorAlertControllerWithTitle:(NSString *)title {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    return alertController;
}

+ (UIAlertController *)successAlertControllerWithTitle:(NSString *)title {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
																			 message:nil
																	  preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:nil];
	[alertController addAction:cancelAction];
	
	return alertController;
}

+ (UIAlertController *)successAlertControllerWithTitle:(NSString *)title
											completion:(VoidCompletion)completion {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
																			 message:nil
																	  preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:^(UIAlertAction *action){
															 completion();
														 }];
	[alertController addAction:cancelAction];
	
	return alertController;
}

@end
