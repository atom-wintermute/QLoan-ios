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

- (BOOL)shouldUpdateCellWithObject:(QLLendOrderCellObject *)object {
    [self layoutIfNeeded];
    
    self.photoImageView.image = [UIImage imageNamed:object.photoNameString];
    self.photoImageView.layer.cornerRadius = CGRectGetWidth(self.photoImageView.frame) / 2;
    self.photoImageView.layer.masksToBounds = YES;
    
    CALayer *ratingLayer = self.fakeImageView.layer;
    
    ratingLayer.masksToBounds = NO;
    ratingLayer.shadowColor = [UIColor ql_shadowColor].CGColor;
    ratingLayer.shadowOffset = CGSizeMake(0.0, 5.0);
    ratingLayer.shadowRadius = 6.0;
    ratingLayer.shadowOpacity = 0.96;
    ratingLayer.shadowPath = [UIBezierPath bezierPathWithRect:self.fakeImageView.bounds].CGPath;
    
    self.ratingLabel.text = object.ratingString;
    self.sumLabel.text = object.sumString;
    self.percentLabel.text = object.percentString;
	self.nameLabel.text = object.nameString;
	
    return YES;
}

+ (CGFloat)heightForObject:(id)object
               atIndexPath:(NSIndexPath *)indexPath
                 tableView:(UITableView *)tableView {
    return QLLendOrderCellHeight;
}

@end
