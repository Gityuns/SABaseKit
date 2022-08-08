//
//  SAEmptyView.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, SAEmptyState) {
    SAEmptyStateLoading, /// 正在加载
    SAEmptyStateError,   /// 加载失败
    SAEmptyStateEmpty,   /// 没有数据
    SAEmptyStateSucc,    /// 加载成功
};

@interface SAEmptyView : UIView
/// 当前页面状态
@property (nonatomic, assign) SAEmptyState state;
/// 展示信息
@property (nonatomic, copy) NSString *notice;

@end

NS_ASSUME_NONNULL_END
