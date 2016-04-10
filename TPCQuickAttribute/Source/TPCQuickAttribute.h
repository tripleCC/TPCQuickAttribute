//
//  TPCQuickAttribute.h
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCQuickProtcol.h"
#import "NSObject+TPCQuickAttribute.h"

#if TPC_OPEN_LOG == 1
#ifdef DEBUG
#define TPCLayoutLog(s, ... ) NSLog( @"<%s:(%d)> %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] ) 
#else
#define TPCLayoutLog(s, ... )
#endif
#else
#define TPCLayoutLog(s, ... )
#endif
@interface TPCQuickAttribute : NSObject <TPCQuickProtcol>
- (instancetype)initWithView:(UIView *)view;
@property (weak, nonatomic, readonly) UIView *view;
@property (weak, nonatomic) UIView *referView;

- (TPCQuickAttribute *(^)(UIView * view))referToView;
- (TPCQuickAttribute *(^)(UIView *))addToView;
- (TPCQuickAttribute *(^)())end;
@end
