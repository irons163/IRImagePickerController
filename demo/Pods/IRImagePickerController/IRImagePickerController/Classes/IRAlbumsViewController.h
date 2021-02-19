//
//  IRAlbumsViewController.h
//  IRImagePickerController
//
//  Created by Phil on 2020/11/11.
//  Copyright © 2020 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "IRImagePickerController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRAlbumsViewController : UITableViewController

@property (nonatomic, weak) IRImagePickerController *imagePickerController;

@end

NS_ASSUME_NONNULL_END
