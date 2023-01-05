//
//  UIViewController+SALoadingView.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "SALoadingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SALoadingView)

@property (nonatomic, strong) SALoadingView *loadingView;

@property (nonatomic, assign) SALoadingState loadingState;

-(void)showEmptyViewIn:(UIView *)container;

@end

NS_ASSUME_NONNULL_END
