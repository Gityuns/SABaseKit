//
//  UIViewController+SALoadingView.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "UIViewController+SALoadingView.h"
#import <objc/runtime.h>
#import "Masonry/Masonry.h"

@implementation UIViewController (SALoadingView)

-(SALoadingView *)loadingView{
    return  (SALoadingView *)objc_getAssociatedObject(self, "loadingView");
}

-(void)setLoadingView:(SALoadingView *)loadingView{
    objc_setAssociatedObject(self, "loadingView", loadingView, OBJC_ASSOCIATION_RETAIN);
}

-(SALoadingState)loadingState{
    return [objc_getAssociatedObject(self, "loadingState") integerValue];
}

-(void)setLoadingState:(SALoadingState)loadingState{
    objc_setAssociatedObject(self, "loadingState", @(loadingState), OBJC_ASSOCIATION_ASSIGN);
}

-(void)showEmptyViewIn:(UIView *)container{
    if (self.loadingView ) {
        return;
    }
    self.loadingView = [[SALoadingView alloc]init];
    [container addSubview:self.loadingView];
    if ([container isKindOfClass:[UIScrollView class]]) {
        [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
            make.width.height.equalTo(container);
        }];
    }else{
        [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
}
@end
