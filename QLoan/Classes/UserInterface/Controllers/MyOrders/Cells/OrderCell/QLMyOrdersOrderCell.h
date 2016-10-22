//
//  QLMyOrdersOrderCell.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Nimbus/NimbusModels.h>

@interface QLMyOrdersOrderCell : UITableViewCell <NICell>

@property (nonatomic, weak) IBOutlet UILabel *sumLabel;
@property (nonatomic, weak) IBOutlet UILabel *percentLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UIImageView *checkMarkImageView;

@end
