//
//  QLOffsetCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

/**
 Техническая ячейка для создания отступов
 */
@interface QLOffsetCell : UITableViewCell <NICell>

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *cellHeightConstraint;

@end
