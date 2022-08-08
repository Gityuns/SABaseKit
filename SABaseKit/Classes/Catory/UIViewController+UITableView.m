//
//  UIViewController+UITableView.m
//  ShanLib
//
//  Created by mac on 2022/8/2.
//

#import "UIViewController+UITableView.h"
#import <objc/runtime.h>

@implementation UIViewController (UITableView)

-(UITableView *)tableView{
    return (UITableView *)objc_getAssociatedObject(self, "tableView");
}

-(void)setTableView:(UITableView *)tableView{
    objc_setAssociatedObject(self, "tableView", tableView, OBJC_ASSOCIATION_RETAIN);
}

-(NSMutableArray *)datas{
    return (NSMutableArray *)objc_getAssociatedObject(self, "datas");
}

-(void)setDatas:(NSMutableArray *)datas{
    objc_setAssociatedObject(self, "datas", datas, OBJC_ASSOCIATION_RETAIN);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = [self modelForIndexPath:indexPath];
    NSString *reuseIdentifier = [self identifierForModel:model];
    Class class = NSClassFromString(reuseIdentifier);
    if ([class respondsToSelector:@selector(rowHeight)]) {
        return [class rowHeight];
    }
    return UITableViewAutomaticDimension;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.datas.firstObject isKindOfClass:[NSArray class]]) {
        return self.datas.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = [self modelForIndexPath:indexPath];
    NSString *reuseIdentifier = [self identifierForModel:model];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if ([cell respondsToSelector:@selector(updateUIWithModel:)]) {
        [cell performSelector:@selector(updateUIWithModel:) withObject:model];
    }
    if ([cell respondsToSelector:@selector(onClickItemWithTag:attaches:)]) {
        __weak typeof(self) weakSelf = self;
        void (^block)(NSInteger tag,id attaches) = ^(NSInteger tag,id attaches){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf onClickItemWithTag:tag attaches:attaches];
        };
        [cell setValue:block forKey:@"onClickItemWithTag"];
    }
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.textLabel.text = reuseIdentifier;
    }
    return cell;
}

-(NSString *)identifierForModel:(id )model{
    NSString *reuseIdentifier;
    if ([model identifier]) {
        reuseIdentifier = [model identifier];
    }else{
        reuseIdentifier = NSStringFromClass([model class]);
    }
    return reuseIdentifier;
}

-(id)modelForIndexPath:(NSIndexPath *)indexPath{
    id model;
    if ([self.datas.firstObject isKindOfClass:[NSArray class]]) {
        model = self.datas[indexPath.section][indexPath.row];
    }else{
        model = self.datas[indexPath.row];
    }
    return model;
}

-(void)onClickItemWithTag:(NSInteger)tag attaches:(id)attaches{
    
}

@end
