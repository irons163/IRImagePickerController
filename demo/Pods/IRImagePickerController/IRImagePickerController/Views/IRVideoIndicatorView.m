//
//  IRVideoIndicatorView.m
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import "IRVideoIndicatorView.h"

@implementation IRVideoIndicatorView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Add gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[
                             (__bridge id)[[UIColor clearColor] CGColor],
                             (__bridge id)[[UIColor blackColor] CGColor]
                             ];
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
