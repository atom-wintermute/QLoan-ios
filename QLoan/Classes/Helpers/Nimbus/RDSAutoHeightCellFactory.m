//
//  RDSAutoHeightCellFactory.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 21/07/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RDSAutoHeightCellFactory.h"

static NSCache *cellsCache;

@implementation RDSAutoHeightCellFactory

+ (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath
                      model:(NITableViewModel *)model {
    id cellObject = [model objectAtIndexPath:indexPath];
    UITableViewCell<NICell> *cell = [self tableViewCellForCellObject:cellObject inTableView:tableView];

    [cell shouldUpdateCellWithObject:cellObject];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    cell.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];

    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    if (height == 0.0) {
        height = [super tableView:tableView heightForRowAtIndexPath:indexPath model:model];
    } else {
        if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
            height += 1.0f;
        }
    }

    return ceilf(height);
}

+ (UITableViewCell<NICell> *)tableViewCellForCellObject:(id)cellObject inTableView:(UITableView *)tableView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cellsCache = [[NSCache alloc] init];
    });

    NSString *cellReuseId = [self reuseIdFromCellObject:cellObject];

    UITableViewCell<NICell> *result = [cellsCache objectForKey:cellReuseId];
    if (result == nil) {
        if ([cellObject respondsToSelector:@selector(cellNib)]) {
            UINib *nib = [cellObject cellNib];
            result = [nib instantiateWithOwner:nil options:nil][0];
        } else {
            result = [tableView dequeueReusableCellWithIdentifier:cellReuseId];
            result.frame = CGRectMake(0, 0, tableView.frame.size.width, result.frame.size.height);
        }
    }

    if (result != nil) {
        [cellsCache setObject:result forKey:cellReuseId];
    }

    return result;
}

+ (NSString *)reuseIdFromCellObject:(id)cellObject {
    NSString *result = nil;
    if ([cellObject respondsToSelector:@selector(cellClass)]) {
        result = NSStringFromClass([cellObject cellClass]);
    } else if ([cellObject respondsToSelector:@selector(cellNib)]) {
        result = NSStringFromClass([cellObject class]);
    }

    return result;
}


@end
