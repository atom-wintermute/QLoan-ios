//
//  QLMyOrdersOrderCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLMyOrdersOrderCell.h"

#import "QLMyOrdersOrderCellObject.h"

static CGFloat QLMyOrdersOrderCellHeight = 64.0;

@implementation QLMyOrdersOrderCell

#pragma mark - Жизненный цикл

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if (selected) {
        self.contentView.backgroundColor = [UIColor ql_selectedCellColor];
    } else {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted
              animated:(BOOL)animated {
    if (highlighted) {
        self.contentView.backgroundColor = [UIColor ql_selectedCellColor];
    } else {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - NICell

- (BOOL)shouldUpdateCellWithObject:(QLMyOrdersOrderCellObject *)object {
    [self layoutIfNeeded];
    
    self.sumLabel.text = object.sumString;
    self.percentLabel.text = object.percentString;
    self.nameLabel.text = object.nameString;
    self.statusLabel.text = object.statusString;
    self.checkMarkImageView.hidden = !object.showCheckMark;
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLMyOrdersOrderCellHeight;
}

@end
