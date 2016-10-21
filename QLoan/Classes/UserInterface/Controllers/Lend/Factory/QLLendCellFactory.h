//
//  QLLendCellFactory.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

/**
 Протокол фабрики ячеек для экрана выдачи займа
 */
@protocol QLLendCellFactory <NSObject>

- (NSArray *)cellObjects;

@end
