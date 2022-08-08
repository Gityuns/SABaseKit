//
//  ASViewController.m
//  SABaseKit
//
//  Created by acct<blob>=<NULL> on 08/03/2022.
//  Copyright (c) 2022 acct<blob>=<NULL>. All rights reserved.
//

#import "ASViewController.h"
#import "ASUserModel.h"
#import "NSMutableDictionary+Null.h"
#import "NSDictionary+AS.h"

@implementation CellModel


@end

@interface ASViewController ()

@end

@implementation ASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"SABaseKit";
    [self.view addSubview:self.tableView];
    self.tableView.top = 88;
    self.tableView.height = self.view.frame.size.height - 188;


    self.datas = [[NSMutableArray alloc]init];
    
    
    [self loadData];
    [self.tableView registerClass:[ASTableViewCell class] forCellReuseIdentifier:@"CellModel"];
    self.enableHeaderRefresh = true;
//    [self showEmptyViewIn:self.tableView];
//    self.emptyView.backgroundColor = [UIColor whiteColor];
//    self.emptyView.state = SAEmptyStateLoading;
//    self.emptyView.notice = @"请稍后···";
    
//    NSLog(@"%@", [NSFileManager documentsURL]);
//    NSLog(@"%@", [NSFileManager documentsPath]);
//    NSLog(@"%@", [NSFileManager libraryURL]);
//    NSLog(@"%@", [NSFileManager libraryPath]);
//    NSLog(@"%@", [NSFileManager cachesURL]);
//    NSLog(@"%@", [NSFileManager cachesPath]);
    
    [self performSelector:@selector(test) withObject:nil afterDelay:10];
    
}



-(void)loadData{
    {
        CellModel *model = [[CellModel alloc]init];
        model.title = @"UIViewController+UITableView";
        [self.datas addObject:model];
    }
    
    {
        CellModel *model = [[CellModel alloc]init];
        model.title = @"UIViewController+MJRefresh";
        [self.datas addObject:model];
    }
    
    {
        CellModel *model = [[CellModel alloc]init];
        model.title = @"NSTimer";
        model.target = @"ASTimerViewController";
        [self.datas addObject:model];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CellModel *model = self.datas[indexPath.row];
    Class clss = NSClassFromString(model.target);
    UIViewController *vc = [[clss alloc]init];
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)mj_refresh{
    
}

@end

@implementation ASTableViewCell

- (void)updateUIWithModel:(nonnull id)model {
    self.textLabel.text = [model title];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


@end
