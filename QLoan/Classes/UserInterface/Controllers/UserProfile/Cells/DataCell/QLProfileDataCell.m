//
//  QLProfileDataCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileDataCell.h"

#import "QLProfileDataCellObject.h"

static CGFloat const QLProfileDataCellHeight = 44.0;

@implementation QLProfileDataCell

#pragma mark - NICell

- (BOOL)shouldUpdateCellWithObject:(QLProfileDataCellObject *)object {
    self.nameLabel.text = object.nameString;
    self.valueLabel.text = object.valueString;
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLProfileDataCellHeight;
}

@end
