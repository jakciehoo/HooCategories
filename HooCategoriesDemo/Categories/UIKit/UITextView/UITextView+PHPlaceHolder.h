//
//  UITextView+PHPlaceHolder.h
//  PAHealth
//
//  Created by jackiehoo on 19/04/2017.
//  Copyright © 2017 PIngAnHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (PHPlaceHolder)

@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
