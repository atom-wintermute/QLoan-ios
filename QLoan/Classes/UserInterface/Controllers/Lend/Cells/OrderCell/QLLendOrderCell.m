//
//  QLLendOrderCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLLendOrderCell.h"

#import "QLLendOrderCellObject.h"

static CGFloat const QLLendOrderCellHeight = 64.0;

@implementation QLLendOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor ql_selectedCellColor];
    self.selectedBackgroundView = view;
}

- (BOOL)shouldUpdateCellWithObject:(QLLendOrderCellObject *)object {
    
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLLendOrderCellHeight;
}

@end
