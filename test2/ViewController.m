//
//  ViewController.m
//  test2
//
//  Created by 蒋一博 on 16/3/15.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "ViewController.h"
#import "ShowCollectionViewCell.h"
#define imageName @[@"t1",@"t2",@"t3",@"t4",@"t5",@"t6",@"t7",@"t8",@"t9",@"t10"]

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UICollectionView *parallaxCollectionView;


@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.title = @"测试";
        _dataSource = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //数据源加载
    for (NSInteger index = 0; index < 10; index ++) {
        NSString *image = imageName[index];
        [_dataSource addObject:image];
    }
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //配置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(375, 200);
    layout.minimumLineSpacing = 1;
    
    _parallaxCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [_parallaxCollectionView registerClass:[ShowCollectionViewCell class] forCellWithReuseIdentifier:@"showcell"];
    _parallaxCollectionView.backgroundColor = [UIColor whiteColor];
    _parallaxCollectionView.dataSource = self;
    _parallaxCollectionView.delegate = self;
    
    [self.view addSubview:_parallaxCollectionView];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //重用机制,此处标志符sell必须和上面标志符一样
    ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showcell" forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:_dataSource[indexPath.row]];
    CGFloat yOffset = ((self.parallaxCollectionView.contentOffset.y - cell.frame.origin.y) / 200) * 30;
    cell.imageOffset = CGPointMake(0.0f, yOffset);
    return  cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for(ShowCollectionViewCell *view in self.parallaxCollectionView.visibleCells) {
        CGFloat yOffset = ((self.parallaxCollectionView.contentOffset.y - view.frame.origin.y) / 200) * 30;
        view.imageOffset = CGPointMake(0.0f, yOffset);
    }
}

@end
