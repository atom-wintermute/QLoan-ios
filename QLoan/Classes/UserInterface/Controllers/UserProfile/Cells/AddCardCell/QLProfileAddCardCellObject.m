//
//  QLProfileAddCardCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileAddCardCellObject.h"

#import "QLProfileAddCardCell.h"

@implementation QLProfileAddCardCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLProfileAddCardCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLProfileAddCardCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
