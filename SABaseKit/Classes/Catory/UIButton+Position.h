//
//  UIButton+Position.h
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ImagePosition) {
    left = 0,
    right,
    top,
    bottom,
};

@interface UIButton (Position)

/// button 图片 和标题样式， 使用时需要先设置标题 和 图片
@property (nonatomic, assign) ImagePosition position;

@end

NS_ASSUME_NONNULL_END
