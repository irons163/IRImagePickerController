//
//  IRVideoIndicatorView.h
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRVideoIconView.h"
#import "IRSlomoIconView.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRVideoIndicatorView : UIView

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet IRVideoIconView *videoIcon;
@property (nonatomic, weak) IBOutlet IRSlomoIconView *slomoIcon;

@end

NS_ASSUME_NONNULL_END
