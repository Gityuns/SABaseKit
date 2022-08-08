//
//  SAProxy.h
//  SABaseKit
//
//  Created by mac on 2022/8/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAProxy : NSProxy

@property (nonatomic,weak) id target;
@end

NS_ASSUME_NONNULL_END
