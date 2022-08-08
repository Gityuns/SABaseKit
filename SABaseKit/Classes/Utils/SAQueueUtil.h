//
//  SAQueueUtil.h
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAQueueUtil : NSObject
{
    NSCache *queueCache; ///展示礼物队列
    NSMutableDictionary *taskDict;
}
+(instancetype)shareManager;

/// 创建队列
/// @param queueName 队列名
/// @param max 最大并发数目
-(NSOperationQueue *)createQueue:(NSString *)queueName  maxCount:(NSInteger)max;

/// 添加任务
/// @param queueName 队列名
/// @param task 任务
-(void)addTask:(NSString *)queueName task:(void(^)(void))task;

/// 取消队列所有任务 正在执行的任务无法取消
/// @param queueName 队列名
-(void)cancelAllTask:(NSString *)queueName;

/// 向指定队列中添加任务
/// @param queueName 队列名
/// @param task 任务
/// @param key 任务标志
-(void)addTask:(NSString *)queueName task:(void (^)(void))task forKey:(NSString *)key;

/// 通过可以移除任务
/// @param key 任务标志
-(void)removeOperationWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
