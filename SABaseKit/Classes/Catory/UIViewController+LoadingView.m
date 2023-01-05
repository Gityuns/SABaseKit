//
//  UIViewController+LoadingView.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "UIViewController+LoadingView.h"
#import <objc/runtime.h>
#import "Masonry/Masonry.h"

@implementation UIViewController (LoadingView)

-(SALoadingView *)loadingView{
    SALoadingView *loadingView =(SALoadingView *)objc_getAssociatedObject(self, "loadingView");
    if (loadingView == nil) {
        loadingView = [[SALoadingView alloc]initWithFrame:[self loadingViewFrame]];
        [self.view addSubview:loadingView];
        self.loadingView = loadingView;
    }
    return loadingView;
}

-(void)setLoadingView:(SALoadingView *)loadingView{
    objc_setAssociatedObject(self, "loadingView", loadingView, OBJC_ASSOCIATION_RETAIN);
}

-(SALoadingState)loadingState{
    return [objc_getAssociatedObject(self, "loadingState") integerValue];
}

-(void)setLoadingState:(SALoadingState)loadingState{
    objc_setAssociatedObject(self, "loadingState", @(loadingState), OBJC_ASSOCIATION_ASSIGN);
    self.loadingView.state = loadingState;
}

-(CGRect)loadingViewFrame{
    return self.view.bounds;
}

-(void)showEmptyViewIn:(UIView *)container{
    self.loadingView = [[SALoadingView alloc]initWithFrame:container.bounds];
    [container addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}
@end
