//
//  ASViewController.m
//  SABaseKit
//
//  Created by acct<blob>=<NULL> on 08/03/2022.
//  Copyright (c) 2022 acct<blob>=<NULL>. All rights reserved.
//

#import "ASViewController.h"
#import "ASUserModel.h"
#import "SABaseKit.h"
#import "SAViewModel.h"

@implementation CellModel


@end

@interface ASViewController ()

@end

@implementation ASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    self.title = @"SABaseKit";
    [self.view addSubview:self.tableView];
    self.tableView.top = 88;
    self.tableView.height = self.view.frame.size.height - 188;
    self.viewModel = [[SAViewModel alloc]init];
    [self.viewModel requestData:^{
            
    } failure:^(NSString * _Nonnull errMsg) {
            
    }];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation ASTableViewCell

- (void)updateUIWithModel:(nonnull id)model {
    self.textLabel.text = [model title];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


@end
