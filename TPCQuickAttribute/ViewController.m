//
//  ViewController.m
//  TPCQuickAttribute
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TPCQuickAttribute.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *v1 = [UIView new];
    v1.tpc_quickAttribute
    .size(CGSizeMake(100, 100))
    .referToView(self.view)
    .referOrigin(CGPointMake(10, 100))
    .addToView(self.view)
    .backgroundColor([UIColor redColor]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
