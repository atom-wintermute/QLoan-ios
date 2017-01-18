//
//  QLGetViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLGetViewController.h"

#import "QLGetDataDisplayManager.h"
#import "QLBorrowerOrderService.h"
#import "QLGetCellFactory.h"
#import "QLLenderOrderService.h"
#import "QLBorrowerOrder.h"
#import "QLOrderInfo.h"
#import "QLUserInfoService.h"
#import "QLLendOrderCellObject.h"
#import "QLOrderDetailViewController.h"

@interface QLGetViewController () <UITableViewDelegate>

@property (nonatomic, strong) QLGetDataDisplayManager *dataDisplayManager;

@end

@implementation QLGetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Получить займ";
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self loadOrders];
}

- (void)configureView {
    [self.view layoutIfNeeded];
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад"
																			 style:self.navigationItem.backBarButtonItem.style
																			target:nil
																			action:nil];
}

- (void)loadOrders {

	__block NSMutableArray *infoArray = [NSMutableArray new];
	__block NSMutableArray *idsArray = [NSMutableArray new];
	QLUserInfosCompletionBlock userInfoCompletion = ^(NSArray *infos, NSError *error) {
		if (error || infos.count == 0) {
			return;
		}
		
		for (QLOrderInfo *orderInfo in infoArray) {
			for (QLUserInfo *user in infos) {
				if (orderInfo.order.lenderId == user.userId) {
					orderInfo.user = user;
					continue;
				}
			}
		}
		
		[self showOrderInfo:[infoArray copy]];
	};
	
	QLBorrowersOrderCompletion completion = ^(NSArray *orders, NSError *error) {
		
		if (error || orders.count == 0) {
			return;
		}
		
		for (QLBorrowerOrder *order in orders) {
			QLOrderInfo *info = [QLOrderInfo new];
			info.order = order;
			[infoArray addObject:info];
			
			if (![idsArray containsObject:@(order.lenderId)]) {
				[idsArray addObject:@(order.lenderId)];
			}
		}
		[self.userInfoService infoForUserWithIds:[idsArray copy]
									  completion:userInfoCompletion];
	};
	[self.lenderOrderService lenderOrdersWithPage:0
									   sortMethod:QLSortByRating
										ascending:YES
									   completion:completion];
}

- (void)showOrderInfo:(NSArray<QLOrderInfo *> *)orderInfos {
	NSArray *cellObjects = [self.cellFactory cellObjectsFromOrderInfos:orderInfos];
	
	self.dataDisplayManager = [[QLGetDataDisplayManager alloc] initWithInputData:cellObjects
												  andConversionToCellObjectsBlock:^id(id dataObject) {
													  return dataObject;
												  }];
	
	self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
	self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
														   withBaseDelegate:self];
	
	[self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	QLLendOrderCellObject *object = [self.dataDisplayManager objectAtIndexPath:indexPath];
	
	if (object != nil) {
		
		QLOrderInfo *orderInfo = object.orderInfo;
		UIStoryboard *storyboard = self.storyboard;
		QLOrderDetailViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"QLOrderDetailViewController"];
		if (controller != nil) {
			controller.orderInfo = orderInfo;
			[self.navigationController pushViewController:controller
												 animated:YES];
		}
	}
}

@end
