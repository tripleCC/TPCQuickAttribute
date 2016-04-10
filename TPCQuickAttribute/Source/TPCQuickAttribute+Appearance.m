//
//  TPCQuickAttribute+Appearance.m
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "TPCQuickAttribute+Appearance.h"

@implementation TPCQuickAttribute (Appearance)
- (TPCQuickAttribute *(^)(UIColor *))backgroundColor {
    return ^TPCQuickAttribute *(UIColor *backgroundColor) {
        self.view.backgroundColor = backgroundColor;
        return self;
    };
}

- (TPCQuickAttribute *(^)(UIViewContentMode))contentMode {
    return ^TPCQuickAttribute *(UIViewContentMode contentMode) {
        self.view.contentMode = contentMode;
        return self;
    };
}

- (TPCQuickAttribute *(^)(UIFont *))font {
    return ^TPCQuickAttribute *(UIFont *font) {
        return [self setAppearance:font byKey:@"font"];
    };
}

- (TPCQuickAttribute *(^)(UIColor *))textColor {
    return ^TPCQuickAttribute *(UIColor *textColor) {
        return [self setAppearance:textColor byKey:@"textColor"];
    };
}

#pragma mark refer - copy
- (TPCQuickAttribute *)referFont {
    return [self referAppearanceByKey:@"font"];
}

- (TPCQuickAttribute *)referTextColor {
    return [self referAppearanceByKey:@"textColor"];
}

- (TPCQuickAttribute *)referContentMode {
    self.view.contentMode = self.referView.contentMode;
    return self;
}

- (TPCQuickAttribute *)referBackgroundColor {
    self.view.backgroundColor = self.referView.backgroundColor;
    return self;
}

- (TPCQuickAttribute *)referLayerBorder {
    self.view.layer.borderColor = self.referView.layer.borderColor;
    self.view.layer.borderWidth = self.referView.layer.borderWidth;
    return self;
}

- (TPCQuickAttribute *)referCornerRadius {
    self.view.layer.cornerRadius = self.referView.layer.cornerRadius;
    return self;
}

#pragma mark others 
- (TPCQuickAttribute *)referAppearanceByKey:(NSString *)key {
    return [self setAppearance:[self.referView valueForKey:key] byKey:key];
}

- (TPCQuickAttribute *)setAppearance:(id)value byKey:(NSString *)key {
    if ([self.view hasProperty:key] && [self.referView hasProperty:key]) {
        [self.view setValue:value forKeyPath:key];
    }
    return self;
}
@end
