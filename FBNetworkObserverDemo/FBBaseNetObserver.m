//
//  FBBaseNetObserver.m
//  FBNetworkObserverDemo
//
//  Created by admin on 2021/1/16.
//  Copyright © 2021 OrangeTeam. All rights reserved.
//

#import "FBBaseNetObserver.h"

@interface  FBBaseNetObserver()
{
    dispatch_semaphore_t _semaphore;
}

@property (nonatomic, strong) NSMutableArray *observerList;
@property (nonatomic, strong) NSArray *observers;

@end


@implementation FBBaseNetObserver

- (instancetype)init
{
    self = [super init];
    if (self) {
        _observerList = [[NSMutableArray alloc] initWithCapacity:3];
        _semaphore = dispatch_semaphore_create(1);
        
    }
    return self;
}


- (void)addObserver:(id)observer {
    if (!observer || ![observer isKindOfClass:[NSObject class]]) {
        NSLog(@"observer is nil or not object class");
        return;
    }
    
    FBWeakProxy *proxy  = [[FBWeakProxy alloc] init];
    proxy.object = observer;
    if (![_observerList containsObject:proxy]) {
        [_observerList addObject:proxy];
    }
    
}

- (void)removeObserver:(id)observer {
    for (int i = 0; i < _observerList.count; i++) {
        FBWeakProxy *proxy = [_observerList objectAtIndex:i];
        if (proxy.object == observer) {
            [_observerList removeObject:proxy];
            break;
        }
    }
}

- (void)sendObserversEvent:(SEL)sel {
    [self sendEventObservers:sel withObject:self];
}

- (void)sendEventObservers:(SEL)selector withObject:(id)param {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    NSArray *list = self.observerList;
    for (id object in list) {
        if ([object respondsToSelector:selector]) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [object performSelector:selector withObject:param];
        #pragma clang diagnostic pop
        }
    }
    dispatch_semaphore_signal(_semaphore);
}

- (void)sentEventObservers:(SEL)selector withObject:(id)param1 withObject:(id)param2 {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    NSArray *list = self.observerList;
    for (id object in list) {
        if ([object respondsToSelector:selector]) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [object performSelector:selector withObject:param1 withObject:param2];
        #pragma clang diagnostic pop
        }
    }
    dispatch_semaphore_signal(_semaphore);
}

- (NSArray *)observers {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:_observerList.count];
    NSMutableArray *deleteArray = [[NSMutableArray alloc] init];
    
    for (FBWeakProxy *proxy in _observerList) {
        if (proxy.object == nil) {
            [deleteArray addObject:proxy];
        } else {
            [array addObject:proxy.object];
        }
    }
    [_observerList removeObjectsInArray:deleteArray];
    
    return array;
    
}


@end


@implementation FBWeakProxy

- (BOOL)isEqual:(id)object {
    if ([object isMemberOfClass:[FBWeakProxy class]]) {
        FBWeakProxy *proxy = (FBWeakProxy *)object;
        return proxy.object == _object;
    }
    
    return NO;
}

@end
