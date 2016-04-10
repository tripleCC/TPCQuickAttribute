//
//  NSObject+TPCQuickAttribute.m
//  frameview
//
//  Created by tripleCC on 16/4/10.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

#import "NSObject+TPCQuickAttribute.h"

@implementation NSObject (TPCQuickAttribute)
- (BOOL)hasProperty:(NSString *)property {
    if (property.length <= 0) return NO;
    NSString *lowercaseProperty = [property lowercaseString];
    NSString *uppercase = [[property substringToIndex:1] uppercaseString];
    NSString *lowercase = [lowercaseProperty substringFromIndex:1];
    NSString *setProperty = [NSString stringWithFormat:@"set%@%@:", uppercase, lowercase];
    NSLog(@"%@, %@", setProperty, lowercaseProperty);
    return [self respondsToSelector:NSSelectorFromString(setProperty)]
    && [self respondsToSelector:NSSelectorFromString(lowercaseProperty)];
}
@end
