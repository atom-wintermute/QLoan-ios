//
//  QLMoneyFormatter.h
//  QLoan
//
//  Created by Nikulin Maksim on 22/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMoneyFormatter : NSObject

/**
 @author Max Nikulin
 
 Метод возвращает число с тысячным и дробным разделителем, используется для цен в деньгах
 
 @param value форматирумое значение
 
 @return строка в формате вида "2 000,13"
 */
+ (NSString *)numberStringForMoneyFromValue:(NSNumber *)value;

@end
