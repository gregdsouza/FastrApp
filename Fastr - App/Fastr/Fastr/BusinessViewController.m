//
//  BusinessViewController.m
//  Fastr
//
//  Created by Gregory DSouza on 10/11/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import "BusinessViewController.h"
#import <Parse/Parse.h>
#import "EditBusinessViewController.h"

@interface BusinessViewController ()

@end

@implementation BusinessViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.businessRelation = [[PFUser currentUser] objectForKey:@"businessRelation"];
    PFQuery *query = [self.businessRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
        else {
            self.business = objects;
            [self.tableView reloadData];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showEditBusinesses"]){
        EditBusinessViewController *viewController = (EditBusinessViewController *)segue.destinationViewController;
        viewController.business = [NSMutableArray arrayWithArray:self.business];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.business count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    PFUser *user = [self.business objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    
    
    return cell;
}



@end
