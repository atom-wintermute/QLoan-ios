//
//  QLLendOrderCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendOrderCellObject.h"

#import "QLLendOrderCell.h"

@implementation QLLendOrderCellObject

- (Class)cellClass {
    return [QLLendOrderCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLLendOrderCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
