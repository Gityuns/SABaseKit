//
//  SAProxy.m
//  SABaseKit
//
//  Created by mac on 2022/8/4.
//

#import "SAProxy.h"

@implementation SAProxy

-(id)forwardingTargetForSelector:(SEL)aSelector{
    return _target;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [NSObject methodSignatureForSelector:@selector(init)];
}

-(void)forwardInvocation:(NSInvocation *)invocation{
    void *null = NULL;
    [invocation setReturnValue:&null];
}
@end
