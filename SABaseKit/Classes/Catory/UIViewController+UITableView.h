//
//  UIViewController+UITableView.h
//  ShanLib
//
//  Created by mac on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TableViewCellProtocol <NSObject>

@optional
-(void)updateUIWithModel:(id)model;

+(CGFloat)rowHeight;

@property (nonatomic, copy) void (^onClickItemWithTag)(NSInteger tag, id attaches);

@end

@interface UIViewController (UITableView)<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *datas;

-(void)onClickItemWithTag:(NSInteger)tag attaches:(id)attaches;

@end



NS_ASSUME_NONNULL_END


