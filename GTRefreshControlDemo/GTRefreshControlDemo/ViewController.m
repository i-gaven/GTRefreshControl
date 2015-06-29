//
//  ViewController.m
//  GTRefreshControlDemo
//
//  Created by 赵国腾 on 15/6/29.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)pushNextCtrol:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"GTRefreshController" sender:self];
}

@end
