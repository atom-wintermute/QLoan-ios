//
//  QLMyOrdersOrderCellObject.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersOrderCellObject.h"

#import "QLMyOrdersOrderCell.h"

@implementation QLMyOrdersOrderCellObject

#pragma mark - NICellObject

- (Class)cellClass {
    return [QLMyOrdersOrderCell class];
}

#pragma mark - NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([QLMyOrdersOrderCell class])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
