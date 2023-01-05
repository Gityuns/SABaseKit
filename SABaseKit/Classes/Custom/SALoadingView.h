//
//  SALoadingView.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, SALoadingState) {
    SALoadingStateLoading = 1, /// 正在加载
    SALoadingStateError,   /// 加载失败
    SALoadingStateEmpty,   /// 没有数据
    SALoadingStateDone,    /// 加载成功
};

@interface SALoadingView : UIView
/// 当前页面状态
@property (nonatomic, assign) SALoadingState state;

-(void)setNotice:(NSString * _Nonnull)notice forState:(SALoadingState)state;
@end

NS_ASSUME_NONNULL_END
