//
//  QLOffsetCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOffsetCellObject.h"

#import "QLOffsetCell.h"

@implementation QLOffsetCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLOffsetCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLOffsetCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
