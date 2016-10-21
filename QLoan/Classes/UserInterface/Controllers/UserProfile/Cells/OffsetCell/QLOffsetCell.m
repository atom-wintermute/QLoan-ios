//
//  QLOffsetCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLOffsetCell.h"

#import "QLOffsetCellObject.h"

@implementation QLOffsetCell

- (BOOL)shouldUpdateCellWithObject:(QLOffsetCellObject *)object {
    self.cellHeightConstraint.constant = object.cellHeight;
    
    return YES;
}

@end
