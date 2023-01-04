//
//  SABaseViewModel.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/3.
//

#import "SABaseViewModel.h"

@implementation SABaseViewModel

-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}

-(void)requestData:(void (^)(void))success failure:(void(^)(NSString *errMsg))failure{
    
}
@end
