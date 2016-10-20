//
//  NSMutableArray+RDSNilFilter.h
//  Championat
//
//  Created by Andrey Zarembo-Godzyatsky on 16/06/15.
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @author Сергей Крапивенский, 15-10-28 18:10:50
 
 Категория для безопасного добавления элементов в мутабельный массив
 */
@interface NSMutableArray (RDSNilFilter)

/**
 @author Сергей Крапивенский, 15-10-28 18:10:49
 
 Добавляет объект в массив только если этот объект не пустой
 
 @param object Любой объект
 */
- (void)rds_addNonNilObject:(id)object;

/**
 @author Сергей Крапивенский, 15-10-28 18:10:13
 
 Вставляет объект в заданное место массива только если этот объект не пустой
 
 @param object Любой объект
 @param index  Индекс объекта в массиве
 */
- (void)rds_insertNonNilObject:(id)object
                       atIndex:(NSUInteger)index;

/**
 *  Метод добавляет в массив только непустые строки. Если передать что-то другое, объект добавлен не будет
 *
 *  @param string строка для добавления
 */
- (void)rds_addString:(NSString *)string;

@end
