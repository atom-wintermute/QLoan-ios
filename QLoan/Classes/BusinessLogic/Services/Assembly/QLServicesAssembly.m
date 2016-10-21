//
//  QLServicesAssembly.m
//  QLoan
//
//  Created by m.rakhmanov on 17.10.16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLServicesAssembly.h"
#import "QLCoreComponentsAssembly.h"
#import "QLBorrowerOrderService.h"
#import "QLBankAuthServiceImplementation.h"
#import "QLAuthorizationService.h"
#import "QLLenderOrderService.h"
#import "QLUserInteractionService.h"

@interface QLServicesAssembly()

@property (nonatomic, strong) QLCoreComponentsAssembly *coreAssembly;

@end

@implementation QLServicesAssembly

- (QLUserInteractionService *)interactionService {
	return [TyphoonDefinition withClass:[QLUserInteractionService class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(jsonSerializer)
									  with:[self.coreAssembly jsonSerializer]];
				[definition injectProperty:@selector(serializer)
									  with:[self.coreAssembly serializer]];
				[definition injectProperty:@selector(networkClient)
									  with:[self.coreAssembly challengedNetworkClient]];
				[definition injectProperty:@selector(mapper)
									  with:[self.coreAssembly mapper]];
				[definition injectProperty:@selector(requestFactory)
									  with:[self.coreAssembly requestFactory]];
			}];
}

- (QLBorrowerOrderService *)borrowerOrderService {
	return [TyphoonDefinition withClass:[QLBorrowerOrderService class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(jsonSerializer)
									  with:[self.coreAssembly jsonSerializer]];
				[definition injectProperty:@selector(serializer)
									  with:[self.coreAssembly serializer]];
				[definition injectProperty:@selector(networkClient)
									  with:[self.coreAssembly challengedNetworkClient]];
				[definition injectProperty:@selector(mapper)
									  with:[self.coreAssembly mapper]];
				[definition injectProperty:@selector(requestFactory)
									  with:[self.coreAssembly requestFactory]];
			}];
}

- (QLLenderOrderService *)lenderOrderService {
	return [TyphoonDefinition withClass:[QLLenderOrderService class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(jsonSerializer)
									  with:[self.coreAssembly jsonSerializer]];
				[definition injectProperty:@selector(serializer)
									  with:[self.coreAssembly serializer]];
				[definition injectProperty:@selector(networkClient)
									  with:[self.coreAssembly challengedNetworkClient]];
				[definition injectProperty:@selector(mapper)
									  with:[self.coreAssembly mapper]];
				[definition injectProperty:@selector(requestFactory)
									  with:[self.coreAssembly requestFactory]];
			}];
}

- (QLAuthorizationService *)authorizationService {
	return [TyphoonDefinition withClass:[QLAuthorizationService class]
						  configuration:^(TyphoonDefinition *definition)
			{
				[definition injectProperty:@selector(storage)
									  with:[self.coreAssembly keychainStorage]];
				[definition injectProperty:@selector(networkClient)
									  with:[self.coreAssembly challengedNetworkClient]];
				[definition injectProperty:@selector(mapper)
									  with:[self.coreAssembly mapper]];
				[definition injectProperty:@selector(requestFactory)
									  with:[self.coreAssembly requestFactory]];
				[definition injectProperty:@selector(serializer)
									  with:[self.coreAssembly jsonSerializer]];
			}];
}

- (id<QLBankAuthService>)bankAuthService {
    return [TyphoonDefinition withClass:[QLBankAuthServiceImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(networkClient)
                                                    with:[self.coreAssembly networkClient]];
                              [definition injectProperty:@selector(requestFactory)
                                                    with:[self.coreAssembly bankAuthRequestFactory]];
                          }];
}

@end
