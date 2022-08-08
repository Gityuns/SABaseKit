//
//  SAQueueUtil.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "SAQueueUtil.h"

@implementation SAQueueUtil

+(instancetype)shareManager{
    static SAQueueUtil *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SAQueueUtil alloc]init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        queueCache = [[NSCache alloc]init];
        taskDict = [NSMutableDictionary new];
    }
    return self;
}

-(NSOperationQueue *)createQueue:(NSString *)queueName  maxCount:(NSInteger)max{
    NSOperationQueue *queue = [queueCache objectForKey:queueName];
    if (queue == nil) {
        queue = [[NSOperationQueue alloc]init];
        queue.maxConcurrentOperationCount = max;
        [queueCache setObject:queue forKey:queueName];
    }
    return queue;
}

-(void)addTask:(NSString *)queueName task:(void(^)(void))task{
    NSOperationQueue *queue = [self createQueue:queueName maxCount:1];
    [queue addOperationWithBlock:task];
}

-(void)cancelAllTask:(NSString *)queueName{
    NSOperationQueue *queue = [queueCache objectForKey:queueName];
    if (queue) {
        [queue cancelAllOperations];
    }
}

-(void)addTask:(NSString *)queueName task:(void (^)(void))task forKey:(NSString *)key{
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:task];
    NSOperationQueue *queue = [[SAQueueUtil shareManager]createQueue:queueName maxCount:1];
    [queue addOperation:operation];
}

-(void)removeOperationWithKey:(NSString *)key{
    [taskDict removeObjectForKey:key];
}
@end
