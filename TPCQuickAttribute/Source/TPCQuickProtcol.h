//
//  TPCQuickProtcol.h
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TPC_OPEN_LOG 1

@protocol TPCQuickProtcol <NSObject>
- (instancetype)initWithView:(UIView *)view;
@property (weak, nonatomic, readonly) UIView *view;
@property (weak, nonatomic) UIView *referView;
@end
