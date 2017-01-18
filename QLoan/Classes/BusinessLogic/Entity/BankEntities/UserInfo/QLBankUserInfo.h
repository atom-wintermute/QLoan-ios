//
//  QLBankUserInfo.h
//  QLoan
//
//  Created by Nikulin Maksim on 21/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Модель данных пользователя в платформе банка Открытие
 */
@interface QLBankUserInfo : NSObject

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *secondName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSData *avatar;

@end
