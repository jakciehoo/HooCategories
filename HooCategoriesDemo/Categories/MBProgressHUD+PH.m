//
//  MBProgressHUD+PH.m
//  PAHealth
//
//  Created by HooJackie on 16/7/27.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//
#import "MBProgressHUD+PH.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (PH)

static char tapGestureKey;

#pragma mark plain text message

+ (void)showMessage:(NSString *)message {
    [self showMessage:message toView:nil];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = ((UIWindow *)[UIApplication sharedApplication].delegate).window;;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.layer.cornerRadius = 3;
    hud.margin = 10;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14.0f];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:3.0f];
    if (!hud.tapGesture) {
        hud.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:hud action:@selector(tapGestureAction:)];
        hud.tapGesture.numberOfTapsRequired = 1;
        hud.tapGesture.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:hud.tapGesture];
    }
    __weak UITapGestureRecognizer *tapToHide = hud.tapGesture;
    hud.completionBlock = ^() {
        [view removeGestureRecognizer:tapToHide];
    };
}

+ (void)showMessage:(NSString *)message time:(CGFloat)time {
    UIView *view = ((UIWindow *)[UIApplication sharedApplication].delegate).window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:time];
}


#pragma mark error message
+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

+ (void)showError:(NSString *)error time:(CGFloat)time {
    [self showError:error toView:nil time:time];
}

+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error.png" view:view];
}

+ (void)showError:(NSString *)error toView:(UIView *)view time:(CGFloat)time {
    [self show:error icon:@"error.png" view:view time:time];
}

#pragma mark success message
+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

+ (void)showSuccess:(NSString *)success time:(CGFloat)time {
    [self showSuccess:success toView:nil time:time];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view time:(CGFloat)time {
    [self show:success icon:@"success.png" view:view time:time];
}

#pragma mark hide hud
+ (void)hideHUDForView:(UIView *)view {
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
    [self hideHUDForView:nil];
}

#pragma mark private
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view time:(CGFloat)time {
    if (!view) {
        view = ((UIWindow *)[UIApplication sharedApplication].delegate).window;
    }
    [MBProgressHUD hideHUDForView:view];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = text;
    if (icon) {
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    }
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:time];
    
    if (!hud.tapGesture) {
        hud.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:hud action:@selector(tapGestureAction:)];
        hud.tapGesture.numberOfTapsRequired = 1;
        hud.tapGesture.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:hud.tapGesture];
    }
    __weak UITapGestureRecognizer *tapToHide = hud.tapGesture;
    hud.completionBlock = ^() {
        [view removeGestureRecognizer:tapToHide];
    };
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    [MBProgressHUD show:text icon:icon view:view time:3.0f];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture {
    
    [MBProgressHUD hideHUDForView:tapGesture.view];
}

- (UITapGestureRecognizer *)tapGesture {
    return objc_getAssociatedObject(self, &tapGestureKey);
}

- (void)setTapGesture:(UITapGestureRecognizer *)tapGesture {
    objc_setAssociatedObject(self, &tapGestureKey,
                             tapGesture,
                             OBJC_ASSOCIATION_RETAIN);
}

@end
