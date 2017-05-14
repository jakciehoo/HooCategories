//
//  MBProgressHUD+PH.h
//  PAHealth
//
//  Created by HooJackie on 16/7/27.
//  Copyright © 2016年 PIngAnHealth. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (PH)

+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message time:(CGFloat)time;
+ (void)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success time:(CGFloat)time;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view time:(CGFloat)time;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error time:(CGFloat)time;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view time:(CGFloat)time;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@property (nonatomic, strong)UITapGestureRecognizer *tapGesture;

@end
