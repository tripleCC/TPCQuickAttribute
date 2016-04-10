//
//  UIView+TPCQuickFrame.m
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "UIView+TPCQuickAttribute.h"
#import "TPCQuickAttribute.h"
#import <objc/runtime.h>

@implementation UIView (TPCQuickAttribute)
- (TPCQuickAttribute *)tpc_quickAttribute {
    TPCQuickAttribute *quickAttribute = objc_getAssociatedObject(self, _cmd);
    if (!quickAttribute) {
        quickAttribute = [[TPCQuickAttribute alloc] initWithView:self];
        objc_setAssociatedObject(self, _cmd, quickAttribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return quickAttribute;
}

@end
