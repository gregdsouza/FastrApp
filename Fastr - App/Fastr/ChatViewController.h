//
//  ChatViewController.h
//  Fastr
//
//  Created by Gregory DSouza on 10/10/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface ChatViewController: UIViewController <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>

- (IBAction)logout:(id)sender;


@end