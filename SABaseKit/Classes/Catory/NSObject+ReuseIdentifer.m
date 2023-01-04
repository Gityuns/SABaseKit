//
//  NSObject+ReuseIdentifer.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/3.
//

#import "NSObject+ReuseIdentifer.h"
#import <objc/runtime.h>

@implementation NSObject (ReuseIdentifer)

-(NSString *)reuseIdentifer{
    return (NSString *)objc_getAssociatedObject(self, "reuseIdentifer");
}

-(void)setReuseIdentifer:(NSString *)reuseIdentifer{
    objc_setAssociatedObject(self, "reuseIdentifer", reuseIdentifer, OBJC_ASSOCIATION_COPY);
}
@end
