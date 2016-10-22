//
//  QLProfileLogoutCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileLogoutCell.h"

#import "QLProfileLogoutCellObject.h"

#import "QLProfileViewDelegate.h"

static CGFloat QLProfileLogoutCellHeight = 44.0;

@implementation QLProfileLogoutCell

#pragma mark - NICell

- (BOOL)shouldUpdateCellWithObject:(QLProfileLogoutCellObject *)object {
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLProfileLogoutCellHeight;
}

#pragma mark - IBActions

- (void)logoutButtonWasPressed:(id)sender {
    [self.delegate logoutButtonWasPressed];
}

@end
