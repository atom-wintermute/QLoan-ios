//
//  QLRatingModalViewController.h
//  QLoan
//
//  Created by Nikulin Maksim on 23/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLRatingModalViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *doneButton;

- (IBAction)closeButtonWasPressed:(id)sender;

@end
