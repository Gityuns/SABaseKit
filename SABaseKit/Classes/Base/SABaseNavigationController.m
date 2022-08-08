//
//  SABaseNavigationController.m
//  SABaseKit
//
//  Created by mac on 2022/8/8.
//

#import "SABaseNavigationController.h"

@interface SABaseNavigationController ()

@end

@implementation SABaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return [self.viewControllers.firstObject preferredStatusBarStyle];
}

@end
