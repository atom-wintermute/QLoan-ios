//
//  QLProfileLogoutCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileLogoutCellObject.h"

#import "QLProfileLogoutCell.h"

@implementation QLProfileLogoutCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLProfileLogoutCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLProfileLogoutCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
