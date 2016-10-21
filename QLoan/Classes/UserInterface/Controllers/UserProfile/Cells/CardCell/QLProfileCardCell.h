//
//  QLProfileCardCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

/**
 Ячейка для отображения банковской карты в профиле
 */
@interface QLProfileCardCell : UITableViewCell <NICell>

@property (nonatomic, weak) IBOutlet UILabel *cardNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *balanceLabel;

@end
