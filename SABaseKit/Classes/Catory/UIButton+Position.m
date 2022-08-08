//
//  UIButton+Position.m
//  SABaseKit
//
//  Created by mac on 2022/8/3.
//

#import "UIButton+Position.h"
#import <objc/runtime.h>

@implementation UIButton (Position)

- (void)setPosition:(ImagePosition)position{
    objc_setAssociatedObject(self, "position", @(position), OBJC_ASSOCIATION_ASSIGN);
    UIImage *image = self.imageView.image;
    CGSize imageSize = image.size;
    NSString *title = self.titleLabel.text;
    UIFont *font = self.titleLabel.font;
    CGSize textSize = [title boundingRectWithSize:CGSizeMake(200, 90) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    UIEdgeInsets titleEdgeInset = UIEdgeInsetsZero;
    UIEdgeInsets imageEdgeInset = UIEdgeInsetsZero;
    CGFloat textHeight = textSize.height;
    CGFloat textWidth = textSize.width;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    CGFloat midWidth = (textWidth+imageWidth)/2;
    CGFloat midHeight = (textHeight + imageHeight)/2;
    switch (position) {
        case right:
            titleEdgeInset = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
            imageEdgeInset = UIEdgeInsetsMake(0, textWidth, 0, -textWidth);
            break;
        case top:{
            titleEdgeInset = UIEdgeInsetsMake(midHeight-textHeight/2, -(midWidth - textWidth/2), -(midHeight-textHeight/2), (midWidth - textWidth/2));
            imageEdgeInset = UIEdgeInsetsMake(-(midHeight - textHeight/2), midWidth-imageWidth/2, (midHeight - textHeight/2), imageWidth/2-midWidth);
        }break;
        case bottom:{
            titleEdgeInset = UIEdgeInsetsMake(-(midHeight-textHeight/2), -(midWidth - textWidth/2), (midHeight-textHeight/2), (midWidth - textWidth/2));
            imageEdgeInset = UIEdgeInsetsMake((midHeight - textHeight/2), midWidth-imageWidth/2, -(midHeight - textHeight/2), imageWidth/2-midWidth);
        } break;
        default:
            break;
    }
    [self setTitleEdgeInsets:titleEdgeInset];
    [self setImageEdgeInsets:imageEdgeInset];
}

-(ImagePosition)position{
    return (NSInteger)objc_getAssociatedObject(self, "position");
}
@end
