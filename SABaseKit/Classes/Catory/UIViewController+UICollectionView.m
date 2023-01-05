//
//  UIViewController+UICollectionView.m
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/5.
//

#import "UIViewController+UICollectionView.h"
#import "SABaseCollectionViewCell.h"
#import "NSObject+Property.h"
#import "objc/runtime.h"
#import "SAConfig.h"

@implementation UIViewController (UICollectionView)

-(UICollectionViewLayout *)flowLayout{
    return [UICollectionViewFlowLayout new];
}

-(void)setCollectionView:(UICollectionView *)collectionView{
    objc_setAssociatedObject(self, "collectionView", collectionView, OBJC_ASSOCIATION_RETAIN);
}

-(UICollectionView *)collectionView{
    UICollectionView *collectionView = (UICollectionView *)objc_getAssociatedObject(self, "collectionView");
    if (collectionView == nil) {
        collectionView = [self createCollectionView];
        self.collectionView = collectionView;
        self.scrollView = collectionView;
    }
    return collectionView;
}

-(UICollectionView *)createCollectionView{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:[self collectionViewFrame] collectionViewLayout:[self flowLayout]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    return collectionView;
}

-(CGRect)collectionViewFrame{
    return self.view.bounds;
}

-(NSObject *)collectionViewModelAtIndexPath:(NSIndexPath *)indexPath{
    id model =  self.viewModel.datas.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return self.viewModel.datas[indexPath.section][indexPath.row];
    }
    return self.viewModel.datas[indexPath.row];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.viewModel.datas.count == 0) {
        return 0;
    }
    // 如果datas内数据为数组
    id model = self.viewModel.datas[section];
    if ([model isKindOfClass:[NSArray class]]) {
        return [model count];
    }
    return self.viewModel.datas.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.viewModel.datas.count == 0) {
        return 1;
    }
    // 如果datas内数据为数组
    id model = self.viewModel.datas.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return self.viewModel.datas.count;
    }
    return 1;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = [self collectionViewModelAtIndexPath:indexPath];
    if ([model respondsToSelector:@selector(reuseIdentifier)]) {
        Class clss = NSClassFromString(model.reuseIdentifer);
        if ([clss respondsToSelector:@selector(cellSize)]) {
            return [clss cellSize];
        }
    }
    return [self itemSizeForIndexPath:indexPath];
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = [self collectionViewModelAtIndexPath:indexPath];
    NSString *reuseIdentifier = model.reuseIdentifer;
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setValue:@(indexPath.item) forKey:@"tag"];
    if ([cell respondsToSelector:@selector(clickItemOnCellWithTag)]) {
        @weakify(self);
        [cell setClickItemOnCellWithTag:^(NSInteger tag, id  _Nullable attaches) {
            @strongify(self);
            [self clickItemOnCellWithTag:tag attaches:attaches];
        }];
    }
    if ([cell respondsToSelector:@selector(updateUIWithModel:)]) {
        [cell updateUIWithModel:model];
    }
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]init];
        NSLog(@"cell 未注册：%@",reuseIdentifier);
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self didClickCellAtIndexPath:indexPath];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return [self minimumLineSpacingForSectionAtIndex:section];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return [self minimumInteritemSpacingForSectionAtIndex:section];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return [self insetForSectionAtIndex:section];
}

-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


-(CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath{
    return CGSizeZero;
}

-(UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

-(void)clickItemOnCellWithTag:(NSInteger)tag attaches:(id)attaches{
    
}

-(void)didClickCellAtIndexPath:(NSIndexPath*)indexPath{
    
}

#pragma mark -- 注册cell
-(void)registerCellWithClassName:(NSString *)className{
    [self.collectionView registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
}
@end
