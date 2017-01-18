//
//  QLProfileCardCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileCardCellObject.h"

#import "QLProfileCardCell.h"

@implementation QLProfileCardCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLProfileCardCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLProfileCardCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
