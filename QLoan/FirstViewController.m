//
//  FirstViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 13/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "FirstViewController.h"
#import "QLServicesAssembly.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	[self.service borrowerOrderWithId:10 completion:^(QLBorrowerOrder *order, NSError *error) {
		
	}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
