//
//  UIResponder+HUD.m
//  PAHealth
//
//  Created by HooJackie on 16/7/27.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//

#import "UIResponder+HUD.h"
#import "MBProgressHUD+PH.h"

@implementation UIResponder (HUD)

- (void)showErrorMessage:(NSString *)message {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showError:message];
}

- (void)showSuccessMessage:(NSString *)message {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showSuccess:message];
}

- (void)showPlainMessage:(NSString *)message {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showMessage:message];
}

- (void)showErrorMessage:(NSString *)message toView:(UIView *)view {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showError:message toView:view];
}

- (void)showSuccessMessage:(NSString *)message toView:(UIView *)view {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showSuccess:message toView:view];
}

- (void)showPlainMessage:(NSString *)message toView:(UIView *)view {
    if (!message.length) {
        return;
    }
    [MBProgressHUD showMessage:message toView:view];
}

- (void)dismissHudView {
    [MBProgressHUD hideHUD];
}

- (void)showHUDAddedTo:(UIView *)view {
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}
- (void)hideHUDForView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view];
}


@end
