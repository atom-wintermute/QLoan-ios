//
//  QLOrderDetailViewController.h
//  QLoan
//
//  Created by m.rakhmanov on 22.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QLOrderDetailCellObjectFactory.h"
#import "QLBlueGradientButton.h"

@protocol QLStorage;

@class QLOrderInfo;
@class QLUserInteractionService;

typedef NS_ENUM(NSUInteger, QLOrderAction) {
	QLSendRequestToLender = 0,
	QLSendPaymentToBorrower,
	QLSendRepaymentToLender,
	QLDoNothing
};

@interface QLOrderDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *ratingViewContainer;
@property (weak, nonatomic) IBOutlet UILabel *readyToGiveLoanLabel;

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UIImageView *fakeImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet QLBlueGradientButton *requestButton;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;

@property (nonatomic, strong) id<QLStorage> storage;
@property (nonatomic, strong) QLOrderInfo *orderInfo;
@property (nonatomic, strong) QLOrderDetailCellObjectFactory *cellFactory;
@property (nonatomic, strong) QLUserInteractionService *interactionService;

@end
