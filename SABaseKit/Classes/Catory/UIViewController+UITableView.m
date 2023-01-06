//
//  UIViewController+UITableView.m
//  ShanLib
//
//  Created by mac on 2022/8/2.
//

#import "UIViewController+UITableView.h"
#import "NSObject+Property.h"
#import <objc/runtime.h>
#import "SABaseTableViewCell.h"

@implementation UIViewController (UITableView)

#pragma mark - runtime property
-(UITableView *)tableView{
    UITableView *tableView = (UITableView *)objc_getAssociatedObject(self, "tableView");
    if (tableView == nil) {
        tableView = [self createTableView];
        self.tableView = tableView;
        self.scrollView = tableView;
    }
    return tableView;
}

-(UITableView *)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.tableFrame];
    tableView.delegate = self;
    tableView.dataSource = self;
    return tableView;
}

-(void)setTableView:(UITableView *)tableView{
    objc_setAssociatedObject(self, "tableView", tableView, OBJC_ASSOCIATION_RETAIN);
}

-(CGRect)tableFrame{
    return self.view.bounds;
}


#pragma mark - tableView 代理

-(NSObject *)tableViewModelAtIndexPath:(NSIndexPath *)indexPath{
    id model =  self.viewModel.datas.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return self.viewModel.datas[indexPath.section][indexPath.row];
    }
    return self.viewModel.datas[indexPath.row];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.viewModel.datas.count == 0) {
        return 0;
    }
    id model = self.viewModel.datas.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return [self.viewModel.datas[section] count];
    }
    return [self.viewModel.datas count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject* model = [self tableViewModelAtIndexPath:indexPath];
    NSString *reuseIdentifier = model.reuseIdentifer;
    Class class = NSClassFromString(reuseIdentifier);
    if ([class respondsToSelector:@selector(rowHeight)]) {
        return [[class performSelector:@selector(rowHeight)] floatValue];
    }
    return UITableViewAutomaticDimension;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.viewModel.datas.count == 0) {
        return 0;
    }
    id model = self.viewModel.datas.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return self.viewModel.datas.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = [self tableViewModelAtIndexPath:indexPath];
    NSString *reuseIdentifier = model.reuseIdentifer;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(updateUIWithModel:)]) {
        [cell performSelector:@selector(updateUIWithModel:) withObject:model];
    }
    if ([cell respondsToSelector:@selector(clickItemOnCellWithTag)]) {
        __weak typeof(self) weakSelf = self;
        void (^block)(NSInteger tag,id attaches) = ^(NSInteger tag,id attaches){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf clickItemOnCellWithTag:tag attaches:attaches];
        };
        [cell setValue:block forKey:@"clickItemOnCellWithTag"];
    }
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.textLabel.text = reuseIdentifier;
    }
    return cell;
}


-(void)clickItemOnCellWithTag:(NSInteger)tag attaches:(id)attaches{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self didClickCellAtIndexPath:indexPath];
}

-(void)didClickCellAtIndexPath:(NSIndexPath*)indexPath{
    
}

#pragma mark -- 注册cell
-(void)registerCellWithClassName:(NSString *)className{
    [self.tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
}
-(void)regisetrCellWithNibName:(NSString *)nibName{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibName];
}
@end
