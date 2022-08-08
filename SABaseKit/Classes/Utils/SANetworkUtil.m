//
//  SANetworkUtil.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "SANetworkUtil.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <MJExtension/MJExtension.h>

@implementation SANetworkUtil
+(instancetype)defaultManager{
    static SANetworkUtil *tool =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[SANetworkUtil alloc]init];
    });
    return tool;
}

-(AFHTTPSessionManager *)sessionManager{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _sessionManager.responseSerializer= [AFHTTPResponseSerializer serializer];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"image/jpeg",nil];
    }
    return _sessionManager;
}

+(void)updateUserToken:(NSString *)token{
    NSLog(@"=========当前用户token：%@======", token);
    if (token == nil) {
        return;
    }
    AFHTTPSessionManager *manager =[SANetworkUtil defaultManager].sessionManager;

    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
}

/// 开启网络监听
+(void)startNetworkMonitoring:(void(^)(NSInteger networkStatus))networkChanged{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                break;
            default:
                break;
        }
        networkChanged(status);
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+(void)get:(NSString *)url parameters:(id)parameters success:(ObjectCallback)success failure:(ObjectCallback)failure{
    AFHTTPSessionManager *manager = [SANetworkUtil defaultManager].sessionManager;

    [manager GET:url parameters:parameters headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@\nGET\n%@\n%@",url,[parameters mj_JSONString], [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSError *error =nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
        if (error) {
            NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            success(result);
        }else{
            [self dealWithResult:dict success:success failure:failure];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure([SANetworkUtil errMsgWisthError:error]);
        }
        NSLog(@"%@======\n%@",url,error.description);
    }];
}

+(NSString *)errMsgWisthError:(NSError *)error{
    return @"网络异常请稍后再试";
}

+(void)post:(NSString *)url parameters:(id)parameters success:(ObjectCallback )success failure:(ObjectCallback)failure{
    AFHTTPSessionManager *manager = [SANetworkUtil defaultManager].sessionManager;
    [manager POST:url parameters:parameters headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSLog(@"%@\nPOST\n%@\n%@",url,[parameters mj_JSONString], [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
            NSError *error =nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
            if (error) {
                NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                success(result);
            }else{
                [self dealWithResult:dict success:success failure:failure];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        if (failure) {
            failure([SANetworkUtil errMsgWisthError:error]);
        }
    }];
}
    
+(void)uploadPicture:(NSString *)url images:(NSArray *)images parameters:(id)parameters success:(ObjectCallback)success failure:(ObjectCallback)failure{
    AFHTTPSessionManager *manager = [SANetworkUtil defaultManager].sessionManager;// 初始化请求对象
    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithDictionary:@{}];
    [params addEntriesFromDictionary:parameters];
    [manager POST:url parameters:@ {
        @"directory": @"test",
        @"bucketName": @"vps",
    } headers:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<images.count; i++) {
            UIImage *image = [images objectAtIndex:i];
            NSData *data = [SANetworkUtil dataWithImage:image];
            NSDate *date = [NSDate date];
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%f.png", [date timeIntervalSince1970]] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error =nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
        if (error) {
            NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            success(result);
        }else{
            [self dealWithResult:dict success:success failure:failure];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(@"");
        }
    }];
    
}

+(void)dealWithResult:(NSDictionary *)responseObject success:(ObjectCallback)success failure:(ObjectCallback)failure{
    if ([responseObject isKindOfClass:[NSArray class]] ) {
        success(responseObject);
        return;
    }
    if ([responseObject.allKeys containsObject:@"failed"] == NO) {
        success(responseObject);
        return;
    }
    BOOL status = [responseObject[@"failed"] boolValue];
    if (status) {
        if (failure) {
            failure(responseObject[@"message"]);
        }
    }else{
        if (success) {
            success(responseObject);
        }
    }
}
    
+(NSData *)dataWithImage:(UIImage *)image{
    NSInteger maxLength = 700*1024;
    double compression = 0.5;
    NSData *data=UIImageJPEGRepresentation(image, compression);
    while (data.length > maxLength && compression > 0) {
        compression -= 0.05;
        data = UIImageJPEGRepresentation(image, compression); // When compression less than a value, this code dose not work
    }
    return data;
}


@end
