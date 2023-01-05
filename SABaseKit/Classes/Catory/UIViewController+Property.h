//
//  UIViewController+Property.h
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/5.
//

#import <UIKit/UIKit.h>
#import "SABaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Property)

@property (nonatomic, strong) SABaseViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
