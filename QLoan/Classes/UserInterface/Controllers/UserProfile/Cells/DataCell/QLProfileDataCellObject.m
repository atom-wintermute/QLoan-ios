//
//  QLProfileDataCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileDataCellObject.h"

#import "QLProfileDataCell.h"

@implementation QLProfileDataCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLProfileDataCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLProfileDataCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
