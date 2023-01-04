//
//  SABaseViewController.h
//  SABaseKit
//
//  Created by mac on 2022/8/8.
//

#import <UIKit/UIKit.h>
#import "SABaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SABaseViewController : UIViewController

@property (nonatomic, strong) SABaseViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
