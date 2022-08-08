//
//  UIViewController+EmptyView.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "UIViewController+EmptyView.h"
#import <objc/runtime.h>
#import "Masonry/Masonry.h"

@implementation UIViewController (EmptyView)

-(SAEmptyView *)emptyView{
    return  (SAEmptyView *)objc_getAssociatedObject(self, "emptyView");
}

-(void)setEmptyView:(SAEmptyView *)emptyView{
    objc_setAssociatedObject(self, "emptyView", emptyView, OBJC_ASSOCIATION_RETAIN);
}

-(void)showEmptyViewIn:(UIView *)container{
    if (self.emptyView ) {
        return;
    }
    self.emptyView = [[SAEmptyView alloc]init];
    [container addSubview:self.emptyView];
    if ([container isKindOfClass:[UIScrollView class]]) {
        [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
            make.width.height.equalTo(container);
        }];
    }else{
        [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
}
@end
