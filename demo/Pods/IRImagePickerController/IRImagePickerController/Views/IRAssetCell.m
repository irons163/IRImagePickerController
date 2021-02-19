//
//  IRAssetCell.m
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import "IRAssetCell.h"

@interface IRAssetCell ()

@property (weak, nonatomic) IBOutlet UIView *overlayView;

@end

@implementation IRAssetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    // Show/hide overlay view
    self.overlayView.hidden = !(selected && self.showsOverlayViewWhenSelected);
}

@end
