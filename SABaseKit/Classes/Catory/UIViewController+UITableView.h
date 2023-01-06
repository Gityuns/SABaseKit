//
//  UIViewController+UITableView.h
//  ShanLib
//
//  Created by mac on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MJRefresh.h"
#import "UIViewController+Property.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (UITableView)<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
// 点击cell上的按钮的回调事件
-(void)clickItemOnCellWithTag:(NSInteger)tag attaches:(id)attaches;
// 设置table的frame
-(CGRect)tableFrame;
// 获取对应的model
-(NSObject *)tableViewModelAtIndexPath:(NSIndexPath *)indexPath;
// 点击cell事件
-(void)didClickCellAtIndexPath:(NSIndexPath*)indexPath;
#pragma mark -- 注册cell
-(void)registerCellWithClassName:(NSString *)className;
-(void)regisetrCellWithNibName:(NSString *)nibName;
@end

NS_ASSUME_NONNULL_END


