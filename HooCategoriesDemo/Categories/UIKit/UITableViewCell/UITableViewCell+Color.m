//
//  UITableViewCell+Color.m
//  PAHealth
//
//  Created by jackiehoo on 10/01/2017.
//  Copyright © 2017 PIngAnHealth. All rights reserved.
//

#import "UITableViewCell+Color.h"
#import <objc/runtime.h>



@implementation UITableViewCell (Color)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(initWithStyle:reuseIdentifier:);
        SEL swizzledSelector = @selector(swiz_initWithStyle:reuseIdentifier:);
        
        [self swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
    });
}


+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (instancetype)swiz_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    [self swiz_initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    return self;
}

@end
