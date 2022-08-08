//
//  SAEmptyView.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "SAEmptyView.h"
#import "Masonry/Masonry.h"

@interface SAEmptyView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *noticeLabel;
@end

@implementation SAEmptyView

-(instancetype)init{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews{
    
    UIView *container = [[UIView alloc]init];
    [self addSubview:container];
    
    self.imageView = [[UIImageView alloc]init];
    [container addSubview:self.imageView];
    
    self.noticeLabel = [[UILabel alloc]init];
    self.noticeLabel.textAlignment = NSTextAlignmentCenter;
    self.noticeLabel.font = [UIFont systemFontOfSize:14];
    self.noticeLabel.textColor = [UIColor grayColor];
    [container addSubview:self.noticeLabel];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
    }];
    
    [self.noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.imageView.mas_bottom).offset(20);
    }];
}

-(void)setState:(SAEmptyState)state{
    if (state == SAEmptyStateSucc) {
        self.hidden = YES;
    }
    self.hidden = NO;
    if (self.state != SAEmptyStateError) {
        self.imageView.image = [self imageWithName:@"icon_state_empty"];
    }else{
        self.imageView.image = [self imageWithName:@"icon_state_error"];
    }
}

-(void)setNotice:(NSString *)notice{
    self.noticeLabel.text =  notice;
}

-(UIImage *)imageWithName:(NSString *)name{
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *imgName = [NSString stringWithFormat:@"SABaseKit.bundle/%@",name];
    UIImage *image = [UIImage imageNamed:imgName
                              inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}
@end
