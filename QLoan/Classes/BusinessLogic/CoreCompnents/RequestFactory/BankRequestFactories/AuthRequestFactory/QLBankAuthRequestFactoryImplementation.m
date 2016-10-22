//
//  QLBankAuthRequestFactoryImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthRequestFactoryImplementation.h"

@implementation QLBankAuthRequestFactoryImplementation

- (NSURLRequest *)requestForLoginWithLogin:(NSString *)login
                                  password:(NSString *)password {
    NSString *path = QLBankAuthenticate;
    NSDictionary *parameters = @{
                                 @"username": login,
                                 @"password": password,
                                 @"uniqueDeviceId": @"12345",
                                 @"osType": @"iOS",
                                 @"appVersion": @"1.0",
                                 @"timezone": @"0",
                                 @"deviceModel": @"iPhone",
                                 @"osVersion": @"9.3"
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForRegisterWithPhoneNumber:(NSString *)phoneNumber {
    NSString *path = QLBankRegister;
    NSDictionary *parameters = @{
                                 @"phone": phoneNumber,
                                 @"username": phoneNumber,
                                 @"password": @"defaultPassword",
                                 @"firstName": @"defaultFirstName",
                                 @"lastName": @"defaultLastName",
                                 @"email": @"default@mail.ru",
                                 @"password": @"defaultPassword",
                                 @"uniqueDeviceId": @"12345",
                                 @"osType": @"iOS",
                                 @"appVersion": @"1.0",
                                 @"timezone": @"0",
                                 @"deviceModel": @"iPhone",
                                 @"osVersion": @"9.3"
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForVerifyWithCode:(NSString *)code
                                 sessionId:(NSString *)sessionId {
    NSString *path = QLBankCompleteRegistration;
    NSDictionary *parameters = @{
                                 @"verificationCode": code,
                                 @"sessionId": sessionId
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForEditUserWithEmail:(NSString *)email
                                    firstName:(NSString *)firstName
                                   secondName:(NSString *)secondName
                                    sessionId:(NSString *)sessionId {
    NSString *path = QLBankChangeUser;
    NSDictionary *parameters = @{
                                 @"sessionId": sessionId,
                                 @"email": email,
                                 @"firstName": firstName,
                                 @"lastName": secondName
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForChangePasswordWithPassword:(NSString *)password
                                             sessionId:(NSString *)sessionId {
    NSString *path = QLBankChangePassword;
    NSDictionary *parameters = @{
                                 @"sessionId": sessionId,
                                 @"newPassword": password,
                                 @"password": @"defaultPassword",
                                 @"isMobile": @YES
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

- (NSURLRequest *)requestForCurrentUserDataWithSessionId:(NSString *)sessionId; {
    NSString *path = QLBankGetUser;
    NSDictionary *parameters = @{
                                 @"sessionId": sessionId,
                                 @"isMobile": @YES
                                 };
    
    return [self.requestSerializer requestWithMethod:QLPostRequestMethodKey
                                           URLString:[self urlStringWithPath:path]
                                          parameters:parameters
                                               error:NULL];
}

#pragma mark - Приватные методы

- (NSString *)urlStringWithPath:(NSString *)path {
    NSURL *baseUrl = [NSURL URLWithString:QLBankServerBasePath];
    return [[NSURL URLWithString:path relativeToURL:baseUrl] absoluteString];
}

@end
