//
//  EditBusinessViewController.h
//  Fastr
//
//  Created by Gregory DSouza on 10/10/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditBusinessViewController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *business;

- (BOOL)isBusiness:(PFUser *)user;


@end
