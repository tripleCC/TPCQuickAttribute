//
//  TPCQuickAttribute+Frame.m
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute+Frame.h"

@implementation TPCQuickAttribute (Frame)
#pragma mark relative coordinate

- (TPCQuickAttribute *(^)(CGFloat))referLeft {
    return ^TPCQuickAttribute *(CGFloat left) {
        return self.x(self.referView.frame.origin.x + left);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))referRight {
    return ^TPCQuickAttribute *(CGFloat right) {
        if (self.view.frame.size.width == 0) TPCLayoutLog(@"Warning: setting refer right before setting width.");
        return self.referLeft(self.referView.frame.size.width - self.view.frame.size.width + right);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))referTop {
    return ^TPCQuickAttribute *(CGFloat top) {
        return self.y(self.referView.frame.origin.y + top);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))referBottom {
    return ^TPCQuickAttribute *(CGFloat bottom) {
        if (self.view.frame.size.height == 0) TPCLayoutLog(@"Warning: setting refer bottom before setting height.");
        return self.referTop(self.referView.frame.size.height - self.view.frame.size.height + bottom);
    };
}

- (TPCQuickAttribute *(^)(CGPoint))referOrigin {
    return ^TPCQuickAttribute *(CGPoint origin) {
        return self.origin((CGPoint){
            .x = self.referView.frame.origin.x + origin.x,
            .y = self.referView.frame.origin.y + origin.y
        });
    };
}

- (TPCQuickAttribute *(^)(CGSize))referSize {
    return ^TPCQuickAttribute *(CGSize size) {
        return self.size((CGSize){
            .width = self.referView.frame.size.width + size.width,
            .height = self.referView.frame.size.height + size.height
        });
    };
}

- (TPCQuickAttribute *(^)(CGPoint))referCenter {
    return ^TPCQuickAttribute *(CGPoint center) {
        return self.center((CGPoint){
            .x = self.referView.center.x + center.x,
            .y = self.referView.center.y + center.y
        });
    };
}

- (TPCQuickAttribute *(^)(CGFloat))referCenterX {
    return ^TPCQuickAttribute *(CGFloat centerX) {
        return self.centerX(self.referView.center.x + centerX);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))referCenterY {
    return ^TPCQuickAttribute *(CGFloat centerY) {
        return self.centerX(self.referView.center.y + centerY);
    };
}

#pragma mark absolute coordinate
- (TPCQuickAttribute *(^)(CGFloat))x {
    return ^TPCQuickAttribute *(CGFloat x) {
        return [self handleFrame:^(CGRect *frame) {
            frame->origin.x = x;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGFloat))y {
    return ^TPCQuickAttribute *(CGFloat y) {
        return [self handleFrame:^(CGRect *frame) {
            frame->origin.y = y;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGPoint))origin {
    return ^TPCQuickAttribute *(CGPoint origin) {
        return [self handleFrame:^(CGRect *frame) {
            frame->origin = origin;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGFloat))width {
    return ^TPCQuickAttribute *(CGFloat width) {
        return [self handleFrame:^(CGRect *frame) {
            frame->size.width = width;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGFloat))height {
    return ^TPCQuickAttribute *(CGFloat height) {
        return [self handleFrame:^(CGRect *frame) {
            frame->size.height = height;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGSize))size {
    return ^TPCQuickAttribute *(CGSize size) {
        return [self handleFrame:^(CGRect *frame) {
            frame->size = size;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGPoint))center {
    return ^TPCQuickAttribute *(CGPoint center) {
        return [self handerCenter:^(CGPoint *center) {
            *center = self.view.center;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGFloat))centerX {
    return ^TPCQuickAttribute *(CGFloat centerX) {
        return [self handerCenter:^(CGPoint *center) {
            center->x = centerX;
        }];
    };
}

- (TPCQuickAttribute *(^)(CGFloat))centerY {
    return ^TPCQuickAttribute *(CGFloat centerY) {
        return [self handerCenter:^(CGPoint *center) {
            center->y = centerY;
        }];
    };
}

#pragma mark convenience method
- (TPCQuickAttribute *)handleFrame:(void(^)(CGRect *))action {
    CGRect frame = self.view.frame;
    action(&frame);
    self.view.frame = frame;
    return self;
}

- (TPCQuickAttribute *)handerCenter:(void(^)(CGPoint *))action {
    CGPoint center = self.view.center;
    action(&center);
    self.view.center = center;
    return self;
}

@end
