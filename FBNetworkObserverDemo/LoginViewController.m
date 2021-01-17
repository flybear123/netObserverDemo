//
//  LoginViewController.m
//  FBNetworkObserverDemo
//
//  Created by admin on 2021/1/17.
//  Copyright © 2021 OrangeTeam. All rights reserved.
//

#import "LoginViewController.h"
#import "FBBaseNetObserver.h"
#import "FBLoginNetManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加观察
    [[FBLoginNetManager shared] addObserver:self];
    //发起网络请求
    [[FBLoginNetManager shared] loginRequest];
    // Do any additional setup after loading the view.
}


#pragma mark -- LoginNetObserver

- (void)requestLoginInfoSuccess:(FBLoginNetManager *_Nullable)manager withObject:(NSDictionary *_Nullable)dict {
    //处理网络请求成功
}

- (void)requestLoginInfoFailed:(FBLoginNetManager *_Nullable)manager {
    //处理网络请求失败
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
