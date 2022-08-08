//
//  ASTimerViewController.m
//  SABaseKit_Example
//
//  Created by mac on 2022/8/4.
//  Copyright © 2022 acct<blob>=<NULL>. All rights reserved.
//

#import "ASTimerViewController.h"
#import "SAProxy.h"

@interface ASTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) SAProxy *proxy;
@end

@implementation ASTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /// --- 需要在视图消失时 停止计时器，否则会存在内存泄漏
//    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(repeatMethod) userInfo:nil repeats:YES];

    

//    __weak id weakSelf = self;
//    self.timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf repeatMethod];
//    }];


    self.proxy = [SAProxy alloc];
    self.proxy.target = self;
    self.timer = [NSTimer timerWithTimeInterval:1 target:self.proxy selector:@selector(repeatMethod) userInfo:nil repeats:YES];
    
    
   [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.timer invalidate];
}

-(void)repeatMethod{
    NSLog(@"----------");
}


-(void)dealloc{
    self.timer = nil;
}
@end
