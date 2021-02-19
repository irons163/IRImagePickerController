//
//  IRAssetsViewController.h
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class IRImagePickerController;
@class PHAssetCollection;

NS_ASSUME_NONNULL_BEGIN

@interface IRAssetsViewController : UICollectionViewController

@property (nonatomic, weak) IRImagePickerController *imagePickerController;
@property (nonatomic, strong) PHAssetCollection *assetCollection;

@end

NS_ASSUME_NONNULL_END
