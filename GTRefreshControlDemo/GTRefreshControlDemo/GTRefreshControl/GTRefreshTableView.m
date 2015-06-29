//
//  GTRefreshTableView.m
//  GTRefreshControlDemo
//
//  Created by 赵国腾 on 15/6/29.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "GTRefreshTableView.h"
#import "GTRefreshHeader.h"

const CGFloat headerHeight = 60.0f;

typedef NS_ENUM(NSInteger, GTPullRefreshState) {
    GTPullRefreshPulling = 0,
    GTPullRefreshNormal,
    GTPullRefreshLoading
};

@interface GTRefreshTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) GTPullRefreshState pullRefreshState;

@end

@implementation GTRefreshTableView


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
    
    // 添加头视图
    GTRefreshHeader *headerView = [[GTRefreshHeader alloc]initWithFrame:CGRectMake(0, 0 - self.bounds.size.height, self.frame.size.width, self.frame.size.height)];
    
    [self addSubview:headerView];
}

#pragma mark - 表视图代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"refreshCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell : %ld", indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offSet = MAX(scrollView.contentOffset.y * -1, 0);
    offSet = MIN(offSet, headerHeight);
    scrollView.contentInset = UIEdgeInsetsMake(offSet, 0, 0, 0);
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
}

@end
