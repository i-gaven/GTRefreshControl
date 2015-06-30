//
//  GTRefreshHeader.m
//  GTRefreshControlDemo
//
//  Created by 赵国腾 on 15/6/29.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "GTRefreshHeader.h"

const CGFloat refreshHeaderHeight = 60.0f;

@interface  GTRefreshHeader()

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation GTRefreshHeader

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        // 文本label
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
        lab.textColor = [UIColor grayColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = @"下拉刷新";
        [self addSubview:lab];
        self.textLabel = lab;
        
        // 状态指示器
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectZero];
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self addSubview:indicatorView];
        self.activityIndicatorView = indicatorView;
        [self.activityIndicatorView startAnimating];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake((CGRectGetWidth(self.frame) - 200) * 0.5,  CGRectGetHeight(self.frame) - (refreshHeaderHeight + 20) * 0.5, 200, 20);
    self.activityIndicatorView.frame = CGRectMake(60, CGRectGetHeight(self.frame) - (refreshHeaderHeight + 20) * 0.5, 20, 20);
}

@end
