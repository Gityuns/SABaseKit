//
//  SANetworkUtil.h
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ObjectCallback)(id data);

@interface SANetworkUtil : NSObject

@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

+(instancetype)defaultManager;

/// 跟新token
/// @param token token
+(void)updateUserToken:(NSString *)token;

/// 开启网络监听
+(void)startNetworkMonitoring:(void(^)(NSInteger networkStatus))networkChanged;

/// GET请求
/// @param url 请求地址
/// @param parameters 请求参数
/// @param success 成功回调
/// @param failure 失败回调
+(void)get:(NSString *)url parameters:(id)parameters success:(ObjectCallback _Nullable)success failure:(ObjectCallback _Nullable)failure;

/// POST请求
/// @param url 请求地址
/// @param parameters 请求参数
/// @param success 成功回调
/// @param failure 失败回调
+(void)post:(NSString *)url parameters:(id)parameters success:(ObjectCallback _Nullable)success failure:(ObjectCallback _Nullable)failure;

/// 上传图片
/// @param url 请求地址
/// @param images 图片数组
/// @param parameters 请求参数
/// @param success 成功回调
/// @param failure 失败回调
+(void)uploadPicture:(NSString *)url images:(NSArray *)images parameters:(id)parameters success:(ObjectCallback)success failure:(ObjectCallback)failure;
@end

NS_ASSUME_NONNULL_END
