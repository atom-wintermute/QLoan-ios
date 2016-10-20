//
//  QLProfileCellFactory.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

/**
 Протокол фабрики ячеек экрана профиля
 */
@protocol QLProfileCellFactory <NSObject>

- (NSArray *)cellObjects;

@end
