//
//  ViewController.m
//  demo
//
//  Created by Phil on 2020/9/30.
//  Copyright © 2020 Phil. All rights reserved.
//

#import "ViewController.h"
#import <IRImagePickerController/IRImagePickerController.h>
#import <IRGallery/IRGallery.h>

@interface ViewController () <IRImagePickerControllerDelegate> {
    NSMutableDictionary *images;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self->images = [NSMutableDictionary dictionary];
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
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        for (PHAsset *asset in assets) {
            [asset requestContentEditingInputWithOptions:[PHContentEditingInputRequestOptions new] completionHandler:^(PHContentEditingInput * _Nullable contentEditingInput, NSDictionary * _Nonnull info) {
                NSURL *imageURL = contentEditingInput.fullSizeImageURL;
                NSInteger index = [assets indexOfObject:asset];
                [self->images setObject:imageURL.path forKey:@(index)];
                if (self->images.count == assets.count) {
                    dispatch_semaphore_signal(sema);
                }
            }];
        }
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:^{
                IRGalleryViewController *galleryVC = [[IRGalleryViewController alloc] initWithPhotoSource:self];
                galleryVC.startingIndex = 0;
                galleryVC.useThumbnailView = FALSE;
                galleryVC.delegate = self;
                [galleryVC gotoImageByIndex:0 animated:NO];
                [self.navigationController pushViewController:galleryVC animated:YES];
            }];
        });
    });
}

- (void)ir_imagePickerControllerDidCancel:(IRImagePickerController *)imagePickerController {
    NSLog(@"Canceled.");
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - IRGalleryViewControllerDelegate

- (int)numberOfPhotosForPhotoGallery:(IRGalleryViewController *)gallery {
    return images.count;
}

- (IRGalleryPhotoSourceType)photoGallery:(IRGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index {
    return IRGalleryPhotoSourceTypeLocal;
}

- (NSString*)photoGallery:(IRGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index {
    NSString *filename = [NSString stringWithFormat:@"%d", index + 1];
    return [[filename pathComponents] lastObject];
}

- (NSString*)photoGallery:(IRGalleryViewController *)gallery urlForPhotoSize:(IRGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return nil; // network url
}

- (NSString*)photoGallery:(IRGalleryViewController*)gallery filePathForPhotoSize:(IRGalleryPhotoSize)size atIndex:(NSUInteger)index {
    NSString *path = [images objectForKey:@(index)];
    return path;
}

- (bool)photoGallery:(IRGalleryViewController*)gallery isFavoriteForPhotoAtIndex:(NSUInteger)index{
    return NO;
}

- (void)photoGallery:(IRGalleryViewController*)gallery addFavorite:(bool)isAddToFavortieList atIndex:(NSUInteger)index{
    // mark favortie
}

@end
