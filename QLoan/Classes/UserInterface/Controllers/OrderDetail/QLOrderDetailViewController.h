//
//  QLOrderDetailViewController.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QLStorage;

@interface QLOrderDetailViewController : UIViewController

@property (nonatomic, strong) id<QLStorage> storage;

@end
