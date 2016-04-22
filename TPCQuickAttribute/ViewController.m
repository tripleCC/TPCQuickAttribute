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
    .alignOrigin(CGPointMake(10, 20))
    .alignSize(CGSizeMake(-200, -400))
    .backgroundColor([UIColor redColor])
    .addToView(self.view);
    
    UIView *v2 = [UIView new];
    v2.tpc_quickAttribute
    .referToView(v1)
    .size(CGSizeMake(20, 20))
    .alignTopToTop(fzero)
    .alignLeftToRight(fzero)
    .backgroundColor([UIColor orangeColor])
    .addToView(self.view);
    
    UIView *v3 = [UIView new];
    v3.tpc_quickAttribute
    
    ;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
