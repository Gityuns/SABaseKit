//
//  SABaseTableViewCell.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/3.
//

#import "SABaseTableViewCell.h"

@implementation SABaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadUI];
    }
    return self;
}

-(void)loadUI{
    
}

+(CGFloat)rowHeight{
    return UITableViewAutomaticDimension;
}


-(void)updateUIWithModel:(id)model{
    self.model = model;
}


@end
