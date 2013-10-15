//
//  CameraViewController.h
//  Fastr
//
//  Created by Gregory DSouza on 10/11/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end
