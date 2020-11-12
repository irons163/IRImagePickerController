//
//  ViewController.m
//  demo
//
//  Created by Phil on 2020/9/30.
//  Copyright © 2020 Phil. All rights reserved.
//

#import "ViewController.h"
#import <IRImagePickerController/IRImagePickerController.h>

@interface ViewController () <IRImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    IRImagePickerController *imagePickerController = [IRImagePickerController new];
    imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    imagePickerController.delegate = self;
    imagePickerController.mediaType = IRImagePickerMediaTypeAny;
    imagePickerController.allowsMultipleSelection = (indexPath.section == 1);
    imagePickerController.showsNumberOfSelectedAssets = YES;
    
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 1:
                imagePickerController.minimumNumberOfSelection = 3;
                break;
                
            case 2:
                imagePickerController.maximumNumberOfSelection = 6;
                break;
                
            case 3:
                imagePickerController.minimumNumberOfSelection = 3;
                imagePickerController.maximumNumberOfSelection = 6;
                break;

            case 4:
                imagePickerController.maximumNumberOfSelection = 2;
                [imagePickerController.selectedAssets addObject:[PHAsset fetchAssetsWithOptions:nil].lastObject];
                break;
                
            default:
                break;
        }
    }
    
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}


#pragma mark - IRImagePickerControllerDelegate

- (void)ir_imagePickerController:(IRImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets {
    NSLog(@"Selected assets:");
    NSLog(@"%@", assets);
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)ir_imagePickerControllerDidCancel:(IRImagePickerController *)imagePickerController {
    NSLog(@"Canceled.");
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
