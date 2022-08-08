//
//  UIViewController+MJRefresh.m
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import "UIViewController+MJRefresh.h"
#import "MJRefresh/MJRefresh.h"
#import "UIViewController+UITableView.h"
#import <objc/runtime.h>

static const int pageSize = 10;

static const char * headerRefresh = "enableHeaderRefresh";

static const char * footerLoadMore = "enableFooterLoadMore";

@implementation UIViewController (MJRefresh)

-(void)setEnableHeaderRefresh:(BOOL)enableHeaderRefresh{
    if (enableHeaderRefresh) {
        [self configHeaderRefresh];
    }
    objc_setAssociatedObject(self, headerRefresh, @(enableHeaderRefresh), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)enableHeaderRefresh{
    return [objc_getAssociatedObject(self, headerRefresh) boolValue];
}

-(void)setEnableFooterLoadMore:(BOOL)enableFooterLoadMore{
    if (enableFooterLoadMore) {
        [self configFooterLoadMore];
    }
    objc_setAssociatedObject(self, footerLoadMore, @(enableFooterLoadMore), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)enableFooterLoadMore{
    return [objc_getAssociatedObject(self, footerLoadMore) boolValue];
}


-(void)configHeaderRefresh{
    if (self.tableView == nil) {
        return;
    }
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(mj_refresh)];
}

-(void)configFooterLoadMore{
    if (self.tableView == nil) {
        return;
    }
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(mj_loadMore)];
}


-(void)mj_refresh{
    
}

-(void)mj_loadMore{
    
}

-(void)mj_endRefresh{
    if (self.tableView.mj_header) {
        [self.tableView.mj_header endRefreshing];
    }
    if (self.tableView.mj_footer) {
        if (self.datas.count % pageSize != 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
    }
}
@end
