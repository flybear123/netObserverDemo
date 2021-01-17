//
//  FBLoginNetManager.h
//  FBNetworkObserverDemo
//
//  Created by admin on 2021/1/17.
//  Copyright © 2021 OrangeTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBBaseNetObserver.h"
//#import "FBLoginNetManager.h"
@class FBLoginNetManager;
@protocol FGLoginNetObserver <NSObject>

- (void)requestLoginInfoSuccess:(FBLoginNetManager *_Nullable)manager withObject:(NSDictionary *_Nullable)dict;

- (void)requestLoginInfoFailed:(FBLoginNetManager *_Nullable)manager;
@end

NS_ASSUME_NONNULL_BEGIN

@interface FBLoginNetManager : FBBaseNetObserver

+ (instancetype)shared;

- (void)loginRequest;

@end

NS_ASSUME_NONNULL_END
