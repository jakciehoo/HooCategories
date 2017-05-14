//
//  UIScrollView+PHWaterTop.m
//  PAHealth
//
//  Created by HooJackie on 16/8/17.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//
#import <objc/runtime.h>
#import "UIScrollView+PHWaterTop.h"

// We're using its address as the `key` of the associated object.
static char UIScrollViewWaterfallHeader;
static char UIScrollViewWaterfallHeaderSize;

@implementation UIScrollView (PHWaterTop)

// getter
- (UIView *)waterfallHeaderView {
    return objc_getAssociatedObject(self, &UIScrollViewWaterfallHeader);
}

// setter, notice it's OBJC_ASSOCIATION_ASSIGN as declared in header file.
- (void)setWaterfallHeaderView:(UIView *)waterfallHeaderView {
    objc_setAssociatedObject(self, &UIScrollViewWaterfallHeader, waterfallHeaderView, OBJC_ASSOCIATION_ASSIGN);
}

- (void)addWaterfallHeaderView:(UIView *)waterfallHeaderView {
    // make room for the header
    self.contentInset = UIEdgeInsetsMake(waterfallHeaderView.bounds.size.height, 0, 0, 0);
    [self addSubview:waterfallHeaderView];
    // position the header
    waterfallHeaderView.frame = CGRectMake(0, -waterfallHeaderView.bounds.size.height, waterfallHeaderView.bounds.size.width, waterfallHeaderView.bounds.size.height);
    // call setter
    self.waterfallHeaderView = waterfallHeaderView;
    // store the original size, the `waterfallHeaderViewOriginalSize` is the size when the header is added.
    objc_setAssociatedObject(self, &UIScrollViewWaterfallHeaderSize, [NSValue valueWithCGSize:waterfallHeaderView.frame.size], OBJC_ASSOCIATION_RETAIN);
    // connect scrolling event with waterfall header stretching use KVO
    // can not do this beacuase KVO aboservers need to be removed when dealloc, you'll fail on remove an observer that is yourself, need to add this observer & responding code to components that use this category.
    //    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (CGSize)waterfallHeaderViewOriginalSize {
    NSValue *associatedValue = objc_getAssociatedObject(self, &UIScrollViewWaterfallHeaderSize);
    return [associatedValue CGSizeValue];
}

- (void)waterfallHeaderViewFadeIn:(CGFloat)duration {
    UIView *header = self.waterfallHeaderView;
    header.alpha = 0;
    [UIView animateWithDuration:duration||1.0 animations:^{
        header.alpha = 1.0;
    }];
}

#pragma mark - protected

// default stretching behaviour when scrolling down
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        UIView *waterfallHeaderView = self.waterfallHeaderView;
        waterfallHeaderView.frame = CGRectMake(0, offsetY, waterfallHeaderView.bounds.size.width, -offsetY);
    }
}

#pragma mark - private

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self scrollViewDidScroll:self];
}

@end
