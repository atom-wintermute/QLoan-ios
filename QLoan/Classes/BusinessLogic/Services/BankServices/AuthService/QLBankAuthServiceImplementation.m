//
//  QLBankAuthServiceImplementation.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLBankAuthServiceImplementation.h"

#import "QLBankAuthRequestFactory.h"
#import "QLStorage.h"
#import "QLBankAuthMapper.h"

#import "QLNetworkClient.h"
#import "QLJSONSerializer.h"

#import "QLServerResponse.h"
#import "QLBankUserInfo.h"

@implementation QLBankAuthServiceImplementation

- (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
            completion:(QLBankAuthCompletion)completion {
    NSURLRequest *URLRequest = [self.requestFactory requestForLoginWithLogin:login
                                                                    password:password];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
								 return;
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSInteger errorCode = [responseData[QLBankErrorCode] integerValue];
                             if (!errorCode) {
                                 NSString *sessionId = responseData[QLBankSessionId];
                                 if (sessionId.length) {
                                     [self.storage storeObject:sessionId
                                                        forKey:QLBankSessionIdKey];
                                 }
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 run_block_on_main(completion, NO, nil);
                             }
                         }];
}

- (void)logoutCurrentUser:(QLBankAuthCompletion)completion {
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    NSURLRequest *URLRequest = [self.requestFactory requestForLogoutWithSessionId:sessionId];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             if (![responseData[QLBankErrorCode] integerValue]) {
                                 NSString *sessionId = responseData[QLBankSessionId];
                                 if (sessionId.length) {
                                     [self.storage storeObject:sessionId
                                                        forKey:QLBankSessionIdKey];
                                 }
                                 [self.storage removeObjectForKey:QLBankSessionIdKey];
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 run_block_on_main(completion, NO, nil);
                             }
                         }];
}

- (void)registerWithPhoneNumber:(NSString *)phoneNumber
                     completion:(QLBankAuthCompletion)completion {
    NSLog(@"will register with phone number = %@", phoneNumber);
    NSURLRequest *URLRequest = [self.requestFactory requestForRegisterWithPhoneNumber:phoneNumber];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSInteger errorCode = [responseData[QLBankErrorCode] integerValue];
                             if (!errorCode) {
                                 NSString *sessionId = responseData[QLBankSessionId];
                                 if (sessionId.length) {
                                     [self.storage storeObject:sessionId
                                                        forKey:QLBankSessionIdKey];
                                 }
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                                                      code:errorCode
                                                                  userInfo:nil];
                                 run_block_on_main(completion, NO, error);
                             }
                         }];
}

- (void)verifyPhoneNumberWithCode:(NSString *)code
                       completion:(QLBankAuthCompletion)completion {
    NSLog(@"will verify with code = %@", code);
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    NSURLRequest *URLRequest = [self.requestFactory requestForVerifyWithCode:code
                                                                   sessionId:sessionId];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSInteger errorCode = [responseData[QLBankErrorCode] integerValue];
                             if (!errorCode) {
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                                                      code:errorCode
                                                                  userInfo:nil];
                                 run_block_on_main(completion, NO, error);
                             }
                         }];
}

- (void)editUserDataWithEmail:(NSString *)email
                    firstName:(NSString *)firstName
                     lastName:(NSString *)lastName
                   completion:(QLBankAuthCompletion)completion {
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    NSURLRequest *URLRequest = [self.requestFactory requestForEditUserWithEmail:email
                                                                      firstName:firstName
                                                                     secondName:lastName
                                                                      sessionId:sessionId];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSInteger errorCode = [responseData[QLBankErrorCode] integerValue];
                             if (!errorCode) {
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                                                      code:errorCode
                                                                  userInfo:nil];
                                 run_block_on_main(completion, NO, error);
                             }
                         }];
}

- (void)changePasswordWithPassword:(NSString *)password
                        completion:(QLBankAuthCompletion)completion {
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    NSURLRequest *URLRequest = [self.requestFactory requestForChangePasswordWithPassword:password
                                                                               sessionId:sessionId];
    [self.networkClient sendRequest:URLRequest
                         completion:^(QLServerResponse *response, NSError *error) {
                             if (!response.data) {
                                 run_block_on_main(completion, NO, nil);
                             }
                             id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                               options:kNilOptions
                                                                                 error:nil];
                             NSInteger errorCode = [responseData[QLBankErrorCode] integerValue];
                             if (!errorCode) {
                                 run_block_on_main(completion, YES, nil);
                             } else {
                                 NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                                                      code:errorCode
                                                                  userInfo:nil];
                                 run_block_on_main(completion, NO, error);
                             }
                         }];
}

- (void)updateCurrentUserDataWithCompletion:(QLBankAuthUserDataCompletion)completion {
    NSString *sessionId = [self.storage loadObjectForKey:QLBankSessionIdKey];
    if (!sessionId.length) {
        run_block_on_main(completion, nil, [NSError new]);
    } else {
        NSURLRequest *URLRequest = [self.requestFactory requestForCurrentUserDataWithSessionId:sessionId];
        [self.networkClient sendRequest:URLRequest
                             completion:^(QLServerResponse *response, NSError *error) {
                                 if (!response.data) {
                                     run_block_on_main(completion, nil, [NSError new]);
                                 }
                                 id responseData = [NSJSONSerialization JSONObjectWithData:response.data
                                                                                   options:kNilOptions
                                                                                     error:nil];
                                 QLBankUserInfo *bankUserInfo = [self.mapper mapBankUserInfoFromResponseObject:responseData];
                                 [self.storage storeObject:bankUserInfo
                                                    forKey:QLBankUserInfoKey];
                                 run_block_on_main(completion, bankUserInfo, nil);
                             }];
    }
}

- (QLBankUserInfo *)obtainCurrentUserData {
    return [self.storage loadObjectForKey:QLBankUserInfoKey];
}

- (void)addFacebookEntire {
    [self.storage storeObject:@YES
                       forKey:QLBanFacebookKey];
}

- (BOOL)obtainFacebookEntire {
    id object = [self.storage loadObjectForKey:QLBanFacebookKey];
    if (!object) {
        return NO;
    } else {
        return [object boolValue];
    }
}

@end
