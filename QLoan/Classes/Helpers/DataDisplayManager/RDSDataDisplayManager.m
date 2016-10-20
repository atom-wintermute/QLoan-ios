//
//  RDSDataDisplayManager.m
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 06/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RDSDataDisplayManager.h"
#import "NSMutableArray+RDSNilFilter.h"
#import "RDSAutoHeightCellFactory.h"
#import <objc/runtime.h>

@interface RDSDataDisplayManager ()<UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NIMutableTableViewModel *tableDataModel;
@property (nonatomic,weak) id<UITableViewDelegate> baseDelegate;

@end

@implementation RDSDataDisplayManager

- (instancetype)initWithInputData:(NSArray*)data andConversionToCellObjectsBlock:(RDSDataToCellObjectsConvertionBlock)dataToCellObjectsConversionBlock {
    self = [super init];
    if (self) {
        
        NSMutableArray *cellObjects = [NSMutableArray array];
        for (id dataObject in data) {
            id cellObject = dataToCellObjectsConversionBlock(dataObject);
            [cellObjects rds_addNonNilObject:cellObject];
        }
        
        self.tableDataModel = [[NIMutableTableViewModel alloc] initWithSectionedArray:cellObjects
                                                                             delegate:(id)[RDSAutoHeightCellFactory class]];
        
    }
    return self;
}

- (NIMutableTableViewModel *)dataModel {
    return self.tableDataModel;
}

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView {
    self.tableView = tableView;
    return [self dataModel];
}

- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView withBaseDelegate:(id<UITableViewDelegate>)baseTableViewDelegate {
    self.baseDelegate = baseTableViewDelegate;
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.baseDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.baseDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    else {
        return [[RDSAutoHeightCellFactory class] tableView:tableView heightForRowAtIndexPath:indexPath model:[self dataModel]];
    }
}

// Delegate Forwarding

- (BOOL)shouldForwardSelector:(SEL)selector {
    struct objc_method_description description;
    description = protocol_getMethodDescription(@protocol(UITableViewDelegate), selector, NO, YES);
    return (description.name != NULL && description.types != NULL);
}

- (BOOL)respondsToSelector:(SEL)selector {
    if ([super respondsToSelector:selector]) {
        return YES;
        
    } else if ([self shouldForwardSelector:selector]) {
        if ([self.baseDelegate respondsToSelector:selector]) {
            return YES;
        }
    }
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self shouldForwardSelector:aSelector]) {
        if ([self.baseDelegate respondsToSelector:aSelector]) {
            return self.baseDelegate;
        }
    }
    return self;
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [self.tableDataModel objectAtIndexPath:indexPath];
}

@end
