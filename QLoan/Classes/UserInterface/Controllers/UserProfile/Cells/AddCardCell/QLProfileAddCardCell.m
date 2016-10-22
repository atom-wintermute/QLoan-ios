//
//  QLProfileAddCardCell.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileAddCardCell.h"

#import "QLProfileAddCardCellObject.h"

#import "QLProfileViewDelegate.h"

static CGFloat const QLProfileAddCardCellHeight = 44.0;

@implementation QLProfileAddCardCell

#pragma mark - Жизненный цикл

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor ql_selectedCellColor];
    self.selectedBackgroundView = view;
}

#pragma mark - NICell

- (BOOL)shouldUpdateCellWithObject:(QLProfileAddCardCellObject *)object {
    self.delegate = object.delegate;
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLProfileAddCardCellHeight;
}

#pragma mark - Методы интерфейса

- (void)addCardButtonWasPressed:(id)sender {
    [self.delegate addCardButtonWasPressed];
}

@end
