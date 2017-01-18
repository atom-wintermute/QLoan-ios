//
//  RDSDataDisplayManager.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 06/08/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Nimbus/NimbusModels.h>
#import "RDSDataDisplayManagerProtocol.h"

typedef id(^RDSDataToCellObjectsConvertionBlock)(id dataObject);

@interface RDSDataDisplayManager : NSObject<RDSDataDisplayManagerProtocol>

@property (nonatomic,weak,readonly) UITableView *tableView;

@property (nonatomic,weak,readonly) id<UITableViewDelegate> baseDelegate;

- (instancetype)initWithInputData:(NSArray*)data andConversionToCellObjectsBlock:(RDSDataToCellObjectsConvertionBlock)dataToCellObjectsConversionBlock;
- (NIMutableTableViewModel*)dataModel;

- (id)objectAtIndexPath:(NSIndexPath*)indexPath;

@end
