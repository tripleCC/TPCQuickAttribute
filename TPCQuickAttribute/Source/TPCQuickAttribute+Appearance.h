//
//  TPCQuickAttribute+Appearance.h
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute.h"

@interface TPCQuickAttribute (Appearance)
- (TPCQuickAttribute *)referFont;
- (TPCQuickAttribute *)referLayerBorder;
- (TPCQuickAttribute *)referCornerRadius;
- (TPCQuickAttribute *)referTextColor;
- (TPCQuickAttribute *)referContentMode;
- (TPCQuickAttribute *)referBackgroundColor;

- (TPCQuickAttribute *(^)(UIFont *))font;
- (TPCQuickAttribute *(^)(UIColor *))textColor;
- (TPCQuickAttribute *(^)(UIColor *))backgroundColor;
- (TPCQuickAttribute *(^)(UIViewContentMode))contentMode;

- (TPCQuickAttribute *)referAppearanceByKey:(NSString *)key;
@end
