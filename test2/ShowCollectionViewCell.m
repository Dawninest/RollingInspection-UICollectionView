//
//  ShowCollectionViewCell.m
//  test2
//
//  Created by 蒋一博 on 16/3/16.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "ShowCollectionViewCell.h"

@interface ShowCollectionViewCell()

@property (nonatomic, strong, readwrite) UIImageView *showImageView;

@end

@implementation ShowCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImageView];
    }
    return self;
}

- (void)setImageView
{
    self.clipsToBounds = YES;
    self.showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, 200)];
    self.showImageView.backgroundColor = [UIColor redColor];
    self.showImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.showImageView.clipsToBounds = NO;
    [self addSubview:self.showImageView];
}

- (void)setImage:(UIImage *)image
{
    self.showImageView.image = image;
    [self setImageOffset:self.imageOffset];
}

- (void)setImageOffset:(CGPoint)imageOffset
{
    _imageOffset = imageOffset;
    CGRect frame = self.showImageView.bounds;
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    self.showImageView.frame = offsetFrame;
}

@end
