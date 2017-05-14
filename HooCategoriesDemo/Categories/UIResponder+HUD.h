//
//  UIResponder+HUD.h
//  PAHealth
//
//  Created by HooJackie on 16/7/27.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIResponder (HUD)

// Show message with or without an indicator icon, they will be hidden automatically after a short delay.
- (void)showErrorMessage:(NSString *)message;
- (void)showSuccessMessage:(NSString *)message;
- (void)showPlainMessage:(NSString *)message;
- (void)showErrorMessage:(NSString *)message toView:(UIView *)view;
- (void)showSuccessMessage:(NSString *)message toView:(UIView *)view;
- (void)showPlainMessage:(NSString *)message toView:(UIView *)view;

- (void)showHUDAddedTo:(UIView *)view;
- (void)hideHUDForView:(UIView *)view;

@end
