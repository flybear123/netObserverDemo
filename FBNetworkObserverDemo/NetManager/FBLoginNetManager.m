//
//  FBLoginNetManager.m
//  FBNetworkObserverDemo
//
//  Created by admin on 2021/1/17.
//  Copyright © 2021 OrangeTeam. All rights reserved.
//

#import "FBLoginNetManager.h"

@implementation FBLoginNetManager

+ (instancetype)shared {
    static FBLoginNetManager *loginManager;
    static dispatch_once_t once;
    _dispatch_once(&once, ^{
        if (!loginManager){
            loginManager = [[FBLoginNetManager alloc] init];
        }
    });
    return loginManager;
}

- (void)loginRequest {
    BOOL success = false;
    NSDictionary *dict;
    if (success) {
        [self sentEventObservers:@selector(requestLoginInfoSuccess:withObject:) withObject:self withObject:dict];
    } else {
        [self sendEventObservers:@selector(requestLoginInfoFailed:) withObject:self];
    }
}


@end
