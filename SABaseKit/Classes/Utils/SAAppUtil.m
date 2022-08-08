//
//  SAAppUtil.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "SAAppUtil.h"
#import <MJExtension/MJExtension.h>

@implementation SAAppConfig


@end

@implementation SAAppUtil

+ (instancetype)defaultManager{
    static SAAppUtil *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SAAppUtil alloc]init];
    });
    return instance;
}

-(void)setConfig:(SAAppConfig *)config{
    _config = config;
    [self loadCache];
}

-(void)setUser:(id _Nullable)user{
    [self updateLoginState:user];
    _user = user;
}

-(void)updateLoginState:(id)user{
    if (user && _user == nil) {
        _isLogin = YES;
        if (self.onLoginStateChanged) {
            self.onLoginStateChanged(_isLogin);
        }
    }
    if (_user && user == nil) {
        _isLogin = false;
        if (self.onLoginStateChanged) {
            self.onLoginStateChanged(_isLogin);
        }
    }
}

-(void)loginOut{
    self.user = nil;
}

-(void)saveUser{
    NSDictionary *json = [self.user mj_keyValues];
    [[NSUserDefaults standardUserDefaults] setValue:json forKey:@"ASAppUtil.user"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadCache{
    if (self.config == nil) {
        NSLog(@"请先配置config");
    }
    NSDictionary *json = [[NSUserDefaults standardUserDefaults]objectForKey:@"ASAppUtil.user"];
    if (json == nil) {
        return;
    }
    Class clss = NSClassFromString(self.config.userClass);
    self.user = [clss mj_objectWithKeyValues:json];
}
@end
