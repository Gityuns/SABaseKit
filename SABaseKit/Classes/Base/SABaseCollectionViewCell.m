//
//  SABaseCollectionViewCell.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/3.
//

#import "SABaseCollectionViewCell.h"

@implementation SABaseCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

-(void)loadUI{
    
}

+(CGSize)cellSize{
    return CGSizeMake(90, 90);
}

-(void)updateUIWithModel:(id)model{
    self.model = model;
}
@end
