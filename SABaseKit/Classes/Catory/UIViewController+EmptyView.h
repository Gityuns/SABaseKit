//
//  UIViewController+EmptyView.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "SAEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (EmptyView)

@property (nonatomic, strong) SAEmptyView *emptyView;

-(void)showEmptyViewIn:(UIView *)container;
@end

NS_ASSUME_NONNULL_END
