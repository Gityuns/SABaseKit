//
//  UIImage+Color.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+(UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size{
    CGRect rect= CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+(UIImage *)imageFromColor:(UIColor *)from
                   toColor:(UIColor *)to
                      size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, size.width, 0);
    CGPathAddLineToPoint(path, NULL, size.width, size.height);
    CGPathAddLineToPoint(path, NULL, 0, size.height);
    CGPathCloseSubpath(path);
    [self drawRadialGradient:gc path:path startColor:from.CGColor endColor:to.CGColor];
    CGPathRelease(path);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (void)drawRadialGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextEOClip(context);

    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 1), CGPointMake(CGRectGetMaxX(pathRect), 1), 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}
@end
