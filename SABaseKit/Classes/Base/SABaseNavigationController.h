//
//  SABaseNavigationController.h
//  SABaseKit
//
//  Created by mac on 2022/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SABaseNavigationController : UINavigationController

@property (nonatomic, weak) UIViewController *rootViewController;
@end

NS_ASSUME_NONNULL_END
