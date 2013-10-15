//
//  BusinessViewController.h
//  Fastr
//
//  Created by Gregory DSouza on 10/11/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BusinessViewController : UITableViewController

@property (nonatomic, strong) PFRelation *businessRelation;
@property (nonatomic, strong) NSArray *business;


@end
