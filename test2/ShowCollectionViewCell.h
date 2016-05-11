//
//  ShowCollectionViewCell.h
//  test2
//
//  Created by 蒋一博 on 16/3/16.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readwrite) UIImage *image;
@property (nonatomic, assign, readwrite) CGPoint imageOffset;

@end
