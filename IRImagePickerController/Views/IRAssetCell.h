//
//  IRAssetCell.h
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IRVideoIndicatorView;

NS_ASSUME_NONNULL_BEGIN

@interface IRAssetCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet IRVideoIndicatorView *videoIndicatorView;

@property (nonatomic, assign) BOOL showsOverlayViewWhenSelected;

@end

NS_ASSUME_NONNULL_END
