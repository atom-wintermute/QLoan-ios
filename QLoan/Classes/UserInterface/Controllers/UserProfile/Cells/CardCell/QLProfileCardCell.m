//
//  QLProfileCardCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileCardCell.h"

#import "QLProfileCardCellObject.h"

static CGFloat const QLProfileCardHeight = 56.0;

@implementation QLProfileCardCell

#pragma mark - NICell

- (BOOL)shouldUpdateCellWithObject:(QLProfileCardCellObject *)object {
    self.cardNameLabel.text = object.cardNameString;
    self.balanceLabel.text = object.balanceString;
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLProfileCardHeight;
}

@end
