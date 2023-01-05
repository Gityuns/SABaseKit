//
//  UIViewController+Property.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/5.
//

#import "UIViewController+Property.h"
#import "objc/runtime.h"

@implementation UIViewController (Property)

-(SABaseViewModel *)viewModel{
    return (SABaseViewModel *)objc_getAssociatedObject(self, "viewModel");
}

-(void)setViewModel:(id)viewModel{
    objc_setAssociatedObject(self, "viewModel", viewModel, OBJC_ASSOCIATION_RETAIN);
}
@end
