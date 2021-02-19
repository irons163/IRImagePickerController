#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IRAlbumsViewController.h"
#import "IRAssetsViewController.h"
#import "IRImagePickerController.h"
#import "IRAlbumCell.h"
#import "IRAssetCell.h"
#import "IRCheckmarkView.h"
#import "IRSlomoIconView.h"
#import "IRVideoIconView.h"
#import "IRVideoIndicatorView.h"

FOUNDATION_EXPORT double IRImagePickerControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char IRImagePickerControllerVersionString[];

