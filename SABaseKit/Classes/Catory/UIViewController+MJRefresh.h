//
//  UIViewController+MJRefresh.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MJRefresh)
// 0 tableView  1 collectionView
@property (nonatomic, assign) NSInteger scrollType;

/// 展示下拉刷新
@property (nonatomic, assign) BOOL enableHeaderRefresh;
/// 展示上拉加载更多
@property (nonatomic, assign) BOOL enableFooterLoadMore;

/// 刷新
-(void)mj_refresh;
/// 加载更多
-(void)mj_loadMore;

@end

NS_ASSUME_NONNULL_END
