//
//  SAAppConfig.h
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAAppConfig : NSObject

@property (nonatomic, copy) NSString *userClass;
@end

@interface SAAppUtil : NSObject

+(instancetype)defaultManager;

@property (nonatomic, strong) SAAppConfig *config;

@property (nonatomic, strong) id _Nullable user;

/// 登录状态发生改变后
@property (nonatomic, copy) void (^onLoginStateChanged)(Boolean isLogin);

/// 是否登录
@property (nonatomic, assign) BOOL isLogin;

/// 退出登录
-(void)loginOut;

/// 保存用户信息
-(void)saveUser;
@end

NS_ASSUME_NONNULL_END
