//
//  TPCQuickAttribute+Frame.h
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute.h"

#define pzero CGPointZero
#define szero CGSizeZero
#define fzero 0

@interface TPCQuickAttribute (Frame)

- (TPCQuickAttribute *(^)(CGFloat))alignLeftToLeft;
- (TPCQuickAttribute *(^)(CGFloat))alignLeftToRight;
- (TPCQuickAttribute *(^)(CGFloat))alignRightToLeft;
- (TPCQuickAttribute *(^)(CGFloat))alignRightToRight;
- (TPCQuickAttribute *(^)(CGFloat))alignWidthToLeft;
- (TPCQuickAttribute *(^)(CGFloat))alignWidthToRight;
- (TPCQuickAttribute *(^)(CGFloat))alignTopToTop;
- (TPCQuickAttribute *(^)(CGFloat))alignTopToBottom;
- (TPCQuickAttribute *(^)(CGFloat))alignBottomToTop;
- (TPCQuickAttribute *(^)(CGFloat))alignBottomToBottom;

- (TPCQuickAttribute *(^)(CGPoint))alignOrigin;
- (TPCQuickAttribute *(^)(CGSize))alignSize;
- (TPCQuickAttribute *(^)(CGPoint))alignCenter;
- (TPCQuickAttribute *(^)(CGFloat))alignCenterX;
- (TPCQuickAttribute *(^)(CGFloat))alignCenterY;

- (TPCQuickAttribute *(^)(CGFloat))x;
- (TPCQuickAttribute *(^)(CGFloat))y;
- (TPCQuickAttribute *(^)(CGPoint))origin;
- (TPCQuickAttribute *(^)(CGFloat))width;
- (TPCQuickAttribute *(^)(CGFloat))height;
- (TPCQuickAttribute *(^)(CGSize))size;
- (TPCQuickAttribute *(^)(CGFloat))centerX;
- (TPCQuickAttribute *(^)(CGFloat))centerY;
- (TPCQuickAttribute *(^)(CGPoint))center;

- (TPCQuickAttribute *)handleFrame:(void(^)(CGRect *))action;
- (TPCQuickAttribute *)handerCenter:(void(^)(CGPoint *))action;

- (CGFloat)referViewX;
- (CGFloat)referViewY;
- (CGFloat)referViewCenterX;
- (CGFloat)referViewCenterY;
@end
