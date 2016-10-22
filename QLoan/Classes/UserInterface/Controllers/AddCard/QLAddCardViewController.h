//
//  QLAddCardViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QLBankCardService;

@interface QLAddCardViewController : UIViewController

@property (nonatomic, strong) id<QLBankCardService> bankCardService;

@end
