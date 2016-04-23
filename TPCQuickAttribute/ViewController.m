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
    .referToView(self.view)
    .addToView(self.view)
    .alignOrigin(CGPointMake(10, 20))
    .alignSize(CGSizeMake(-200, -400))
    .backgroundColor([UIColor redColor]);
    
    UIView *v2 = [UIView new];
    v2.tpc_quickAttribute
    .referToView(v1)
    .addToView(v1)
    .size(CGSizeMake(20, 20))
    .alignCenter(pzero)
    .backgroundColor([UIColor orangeColor]);
    
    
    
    UIView *v3 = [UIView new];
    v3.tpc_quickAttribute
    .addToView(self.view)
    .referToView(v1)
    .alignSize(CGSizeMake(20, 20))
    .referToView(self.view)
    .alignRightToRight(20)
    .alignBottomToBottom(20)
    .backgroundColor([[UIColor grayColor] colorWithAlphaComponent:0.4]);
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
