//
//  UIView+Radius.h
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Radius)
/// 设置圆角
/// @param radius 圆角半径
/// @param color 边框颜色
/// @param width 边框宽度
-(void)cornerWithRadius:(CGFloat)radius color:(UIColor*_Nullable)color width:(CGFloat)width;

/// 设置圆角
/// @param radius 圆角半径
-(void)cornerWithRadius:(CGFloat)radius;

/// 设置指定圆角
/// @param radius 圆角半径
/// @param size view的大小
/// @param corners 圆角集合
-(void)cornerWithRadius:(CGFloat)radius size:(CGSize)size corners:(UIRectCorner)corners;

/// 设置指定圆角
/// @param radius 圆角半径
/// @param size view大小
/// @param corners 圆角集合
/// @param color 边框颜色
-(void)cornerWithRadius:(CGFloat)radius size:(CGSize)size corners:(UIRectCorner)corners color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
