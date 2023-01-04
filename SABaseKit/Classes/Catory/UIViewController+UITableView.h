//
//  UIViewController+UITableView.h
//  ShanLib
//
//  Created by mac on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "SABaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TableViewCellProtocol <NSObject>

@optional

-(void)updateUIWithModel:(id)model;

+(CGFloat)rowHeight;
// 点击cell上的按钮的回调事件
@property (nonatomic, copy) void (^clickItemOnCellWithTag)(NSInteger tag, id attaches);

@end


@interface UIViewController (UITableView)<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SABaseViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;
// 点击cell上的按钮的回调事件
-(void)clickItemOnCellWithTag:(NSInteger)tag attaches:(id)attaches;
// 设置table的frame
-(CGRect)tableFrame;
// 获取对应的model
-(id)modelAtIndexPath:(NSIndexPath *)indexPath;
// 点击cell事件
-(void)didClickCellAtIndexPath:(NSIndexPath*)indexPath;
@end



NS_ASSUME_NONNULL_END


