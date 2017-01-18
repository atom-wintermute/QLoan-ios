//
//  QLProfileLogoutCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

@protocol QLProfileViewDelegate;

@interface QLProfileLogoutCell : UITableViewCell <NICell>

@property (nonatomic, weak) id<QLProfileViewDelegate> delegate;

- (IBAction)logoutButtonWasPressed:(id)sender;

@end
