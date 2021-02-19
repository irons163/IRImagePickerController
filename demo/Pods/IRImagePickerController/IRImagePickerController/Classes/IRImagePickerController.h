//
//  IRImagePickerController.h
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <Foundation/Foundation.h>

//! Project version number for IRImagePickerController.
FOUNDATION_EXPORT double IRImagePickerControllerVersionNumber;

//! Project version string for IRImagePickerController.
FOUNDATION_EXPORT const unsigned char IRImagePickerControllerVersionString[];


@class IRImagePickerController;

NS_ASSUME_NONNULL_BEGIN

@protocol IRImagePickerControllerDelegate <NSObject>

@optional
- (void)ir_imagePickerController:(IRImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets;
- (void)ir_imagePickerControllerDidCancel:(IRImagePickerController *)imagePickerController;

- (BOOL)ir_imagePickerController:(IRImagePickerController *)imagePickerController shouldSelectAsset:(PHAsset *)asset;
- (void)ir_imagePickerController:(IRImagePickerController *)imagePickerController didSelectAsset:(PHAsset *)asset;
- (void)ir_imagePickerController:(IRImagePickerController *)imagePickerController didDeselectAsset:(PHAsset *)asset;

@end

typedef NS_ENUM(NSUInteger, IRImagePickerMediaType) {
    IRImagePickerMediaTypeAny = 0,
    IRImagePickerMediaTypeImage,
    IRImagePickerMediaTypeVideo
};

@interface IRImagePickerController : UIViewController

@property (nonatomic, weak) id<IRImagePickerControllerDelegate> delegate;

@property (nonatomic, strong, readonly) NSMutableOrderedSet *selectedAssets;

@property (nonatomic, copy) NSArray *assetCollectionSubtypes;
@property (nonatomic, assign) IRImagePickerMediaType mediaType;

@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfSelection;

@property (nonatomic, copy) NSString *prompt;
@property (nonatomic, assign) BOOL showsNumberOfSelectedAssets;

@property (nonatomic, assign) NSUInteger numberOfColumnsInPortrait;
@property (nonatomic, assign) NSUInteger numberOfColumnsInLandscape;

@end

NS_ASSUME_NONNULL_END
