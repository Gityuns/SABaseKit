//
//  NSObject+Identifier.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "NSObject+Identifier.h"
#import <objc/runtime.h>

@implementation NSObject (Identifier)

- (NSString *)identifier{
    return objc_getAssociatedObject(self, "identifier");
}

- (void)setIdentifier:(NSString *)identifier{
    objc_setAssociatedObject(self, "identifier", identifier, OBJC_ASSOCIATION_COPY);
}
@end
