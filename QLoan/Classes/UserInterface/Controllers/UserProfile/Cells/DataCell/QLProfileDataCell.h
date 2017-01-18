//
//  QLProfileDataCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

/**
 Ячейка для отображения данных на экране профиля
 */
@interface QLProfileDataCell : UITableViewCell <NICell>

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *valueLabel;

@end
