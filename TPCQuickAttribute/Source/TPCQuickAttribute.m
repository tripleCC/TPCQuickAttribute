//
//  TPCQuickAttribute.m
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute.h"

@interface TPCQuickAttribute()
{
    __weak UIView *_referView;
    __weak UIView *_view;
}
@end

@implementation TPCQuickAttribute
- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        _view = view;
    }
    return self;
}

- (void)setReferView:(UIView *)referView {
    NSString *assertLog = [NSString stringWithFormat:@"%@<%p>: refer view should not be nil or self when setting refer constrants", NSStringFromClass([referView class]), referView];
    NSAssert(referView != nil &&  referView != _view, assertLog);
    _referView = referView;
}


- (TPCQuickAttribute *(^)(UIView * view))referToView {
    return ^TPCQuickAttribute *(UIView *view) {
        self.referView = view;
        return self;
    };
}

- (TPCQuickAttribute *(^)(UIView *))addToView {
    return ^TPCQuickAttribute *(UIView *view) {
        [view addSubview:self.view];
        return self;
    };
}

- (void)end {
}

- (BOOL)referViewIsSuperview {
    return _referView == _view.superview;
}
@end
