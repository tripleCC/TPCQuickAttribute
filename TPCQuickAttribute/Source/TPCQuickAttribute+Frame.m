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
- (CGFloat)referViewX {
    return self.referViewIsSuperview ? 0 : self.referView.frame.origin.x;
}

- (CGFloat)referViewY {
    return self.referViewIsSuperview ? 0 : self.referView.frame.origin.y;
}

- (CGFloat)referViewCenterX {
    return self.referViewIsSuperview ? self.referView.frame.size.width * 0.5 : self.referView.center.x;
}

- (CGFloat)referViewCenterY {
    return self.referViewIsSuperview ? self.referView.frame.size.height * 0.5 : self.referView.center.y;
}

- (TPCQuickAttribute *(^)(CGFloat))alignLeftToLeft {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.x(self.referViewX + offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignLeftToRight {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.alignLeftToLeft(self.referView.frame.size.width + offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignRightToLeft {
    return ^TPCQuickAttribute *(CGFloat offset) {
        if (self.view.frame.size.width == 0) TPCLayoutLog(@"Warning: setting refer right before setting width.");
        return self.x(self.referViewX - self.view.frame.size.width - offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignRightToRight {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.alignRightToLeft(offset - self.referView.frame.size.width);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignWidthToLeft {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.width(self.referViewX - self.view.frame.origin.x - offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignWidthToRight {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.alignWidthToLeft(offset - self.referView.frame.size.width);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignTopToTop {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.y(self.referViewY + offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignTopToBottom {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.alignTopToTop(self.referView.frame.size.height + offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignBottomToTop {
    return ^TPCQuickAttribute *(CGFloat offset) {
        if (self.view.frame.size.height == 0) TPCLayoutLog(@"Warning: setting refer bottom before setting height.");
        return self.y(self.referViewY - self.view.frame.size.height - offset);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignBottomToBottom {
    return ^TPCQuickAttribute *(CGFloat offset) {
        return self.alignBottomToTop(offset - self.referView.frame.size.height);
    };
}

- (TPCQuickAttribute *(^)(CGPoint))alignOrigin {
    return ^TPCQuickAttribute *(CGPoint origin) {
        return self.origin((CGPoint){
            .x = self.referViewX + origin.x,
            .y = self.referViewY + origin.y
        });
    };
}

- (TPCQuickAttribute *(^)(CGSize))alignSize {
    return ^TPCQuickAttribute *(CGSize size) {
        return self.size((CGSize){
            .width = self.referView.frame.size.width + size.width,
            .height = self.referView.frame.size.height + size.height
        });
    };
}

- (TPCQuickAttribute *(^)(CGPoint))alignCenter {
    return ^TPCQuickAttribute *(CGPoint center) {
        return self.center((CGPoint){
            .x = self.referViewCenterX + center.x,
            .y = self.referViewCenterY + center.y
        });
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignCenterX {
    return ^TPCQuickAttribute *(CGFloat centerX) {
        return self.centerX(self.referViewCenterX + centerX);
    };
}

- (TPCQuickAttribute *(^)(CGFloat))alignCenterY {
    return ^TPCQuickAttribute *(CGFloat centerY) {
        return self.centerY(self.referViewCenterY + centerY);
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
        return [self handerCenter:^(CGPoint *handerCenter) {
            *handerCenter = center;
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
    TPCLayoutLog(@"%@", NSStringFromCGRect(frame));
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
