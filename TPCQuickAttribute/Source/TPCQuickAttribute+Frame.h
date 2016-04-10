//
//  TPCQuickAttribute+Frame.h
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute.h"

@interface TPCQuickAttribute (Frame)

- (TPCQuickAttribute *(^)(CGFloat))referLeft;
- (TPCQuickAttribute *(^)(CGFloat))referRight;
- (TPCQuickAttribute *(^)(CGFloat))referTop;
- (TPCQuickAttribute *(^)(CGFloat))referBottom;
- (TPCQuickAttribute *(^)(CGPoint))referOrigin;
- (TPCQuickAttribute *(^)(CGSize))referSize;
- (TPCQuickAttribute *(^)(CGPoint))referCenter;
- (TPCQuickAttribute *(^)(CGFloat))referCenterX;
- (TPCQuickAttribute *(^)(CGFloat))referCenterY;

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
@end
