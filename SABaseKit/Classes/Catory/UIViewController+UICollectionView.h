//
//  UIViewController+UICollectionView.h
//  SABaseKit
//
//  Created by 赵郧陕 on 2023/1/5.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MJRefresh.h"
#import "UIViewController+Property.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (UICollectionView)<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

-(UICollectionViewLayout *)flowLayout;
// 设置collectionView 的frame
-(CGRect)collectionViewFrame;
-(NSObject*)collectionViewModelAtIndexPath:(NSIndexPath *)indexPath;
// cell 大小
#pragma mark - UICollectionViewFlowLayout
-(CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section;
-(UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section;
#pragma mark -- 注册cell
-(void)registerCellWithClassName:(NSString *)className;
@end

NS_ASSUME_NONNULL_END
