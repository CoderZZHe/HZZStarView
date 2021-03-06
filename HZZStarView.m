//
//  HZZStarView.m
//  HZZ
//
//  Created by 何志志 on 16/9/5.
//  Copyright © 2016年 hezhizhi. All rights reserved.
//

#import "HZZStarView.h"
#define VIEW_WIDTH (float)(self.frame.size.width)
#define VIEW_HEIGHT (float)(self.frame.size.height)

@implementation HZZStarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:bottomView];
    
    [self addImageViewWithImage:@"star_noBright" SuperView:bottomView];
    
    clipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, VIEW_HEIGHT)];
    clipView.backgroundColor = [UIColor clearColor];
    clipView.clipsToBounds = YES;
    [self addSubview:clipView];
    
    [self addImageViewWithImage:@"star_bright" SuperView:clipView];
}

-(void)addImageViewWithImage:(NSString *)image SuperView:(UIView *)supView{
    CGFloat margin = (VIEW_WIDTH - VIEW_HEIGHT * 5) / 4;
    for (int i = 0; i < 5; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((margin + VIEW_HEIGHT) * i, 0, VIEW_HEIGHT, VIEW_HEIGHT)];
        imageView.image = [UIImage imageNamed:image];
        [supView addSubview:imageView];
    }
}

-(void)setStarProgress:(double)level{
    CGRect clipFrame = clipView.frame;
    clipFrame.size.width = VIEW_WIDTH * level;
    clipView.frame = clipFrame;
}

@end
