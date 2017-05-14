//
//  UIScrollView+PHWaterTop.h
//  PAHealth
//
//  Created by HooJackie on 16/8/17.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (PHWaterTop)

/**
 Reference to the "header view", set and access this property like other normal properties of `UIScrollView`, it'll be associated with the `UIScrollView` object at runtime with the Objective-C runtime feature called "associated objects".
 !!!Important:
 We're not gonna retain the waterfall view here, make sure you're holding it properly.
 */
@property (nonatomic, weak) UIView *waterfallHeaderView;

/**
 Return the original size of the `waterfallHeaderView`, the original value is a snapshot of the status when the `waterfallHeaderView` first added to `UIScrollView`, so make sure the frame of the `waterfallHeaderView` is properly set before add it to `UIScrollView` with `addWaterfallHeaderView`.
 */
- (CGSize)waterfallHeaderViewOriginalSize;

/**
 Add a 'waterfall header' to the `UIScrollView` and configure the `UIScrollView` content inset. Connect the scroll of `UIScrollView` with the transformation (see `scrollViewDidScroll`) of waterfallHeaderView through Objective-C KVO.
 */
- (void)addWaterfallHeaderView:(UIView *)waterfallHeaderView;

/**
 This method will get called when `UIScrollView` scrolled.
 Need to overwrite this method if you want to add more behaviours, the default behaviour is stretch the waterfallHeaderView
 
 Note, you should call this method with the scroll view instance when the scroll view get scrolled.
 Probably should use this
 `[waterfallheadertoppedScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
 Then in
 `- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context`,
 just call
 `[waterfallheadertoppedscrollview scrollViewDidscroll:waterfallheadertoppedscrollview];`
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

/**
 Call this to start an fade in animation on waterfall header view.
 */
- (void)waterfallHeaderViewFadeIn:(CGFloat)duration;

@end
