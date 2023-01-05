//
//  SALoadingView.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "SALoadingView.h"
#import "Masonry/Masonry.h"

@interface SALoadingView ()

@property (nonatomic, strong) NSMutableDictionary *notices;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *noticeLabel;
@end

@implementation SALoadingView

-(NSMutableDictionary *)notices{
    if (_notices == nil) {
        _notices = [[NSMutableDictionary alloc]initWithDictionary:@{
            @(SALoadingStateLoading).description: @"正在加载···",
            @(SALoadingStateEmpty).description: @"呀！啥也没有哦~",
            @(SALoadingStateError).description: @"呜呜，网络开小差哦",
        }];
    }
    return _notices;
}

-(instancetype)init{
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
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
    self.state = SALoadingStateLoading;
}

-(void)setState:(SALoadingState)state{
    if (state == SALoadingStateDone) {
        self.hidden = YES;
    }
    self.hidden = NO;
    if (self.state != SALoadingStateError) {
        self.imageView.image = [self imageWithName:@"icon_state_empty"];
    }else{
        self.imageView.image = [self imageWithName:@"icon_state_error"];
    }
    NSString *notice = [self.notices objectForKey:@(state).description];
    self.noticeLabel.text = notice;
}

-(void)setNotice:(NSString * _Nonnull)notice forState:(SALoadingState)state{
    [self.notices setObject:notice forKey:@(state).description];
}

-(UIImage *)imageWithName:(NSString *)name{
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *imgName = [NSString stringWithFormat:@"SABaseKit.bundle/%@",name];
    UIImage *image = [UIImage imageNamed:imgName
                              inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}
@end
