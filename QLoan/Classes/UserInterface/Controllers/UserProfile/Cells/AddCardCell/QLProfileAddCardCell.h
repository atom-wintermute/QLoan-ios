//
//  QLProfileAddCardCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

@protocol QLProfileViewDelegate;;

/**
 Ячейка добавления карточки
 */
@interface QLProfileAddCardCell : UITableViewCell <NICell>

@property (nonatomic, weak) id<QLProfileViewDelegate> delegate;

- (IBAction)addCardButtonWasPressed:(id)sender;

@end
