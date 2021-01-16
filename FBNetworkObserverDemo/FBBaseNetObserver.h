//
//  FBBaseNetObserver.h
//  FBNetworkObserverDemo
//
//  Created by admin on 2021/1/16.
//  Copyright © 2021 OrangeTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBBaseNetObserver : NSObject

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)sendObserversEvent:(SEL)sel;
- (void)sendEventObservers:(SEL)selector withObject:(id)param;
- (void)sentEventObservers:(SEL)selector withObject:(id)param1 withObject:(id)param2;

@end

@interface FBWeakProxy : NSObject

@property (weak, nonatomic) id object;

@end

NS_ASSUME_NONNULL_END
