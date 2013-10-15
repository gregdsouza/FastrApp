//
//  EditBusinessViewController.m
//  Fastr
//
//  Created by Gregory DSouza on 10/10/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import "EditBusinessViewController.h"


@interface EditBusinessViewController ()

@end

@implementation EditBusinessViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error,[error userInfo]);
        }
        else {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
    
    self.currentUser = [PFUser currentUser];

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
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if([self isBusiness:user]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.AccessoryType = UITableViewCellAccessoryCheckmark;
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *businessRelation = [self.currentUser relationforKey:@"businessRelation"];

    
    if([self isBusiness:user]){
        cell.accessoryType = UITableViewCellAccessoryNone;
        for (PFUser *biz in self.business) {
            if ([biz.objectId isEqualToString:user.objectId]){
                [self.business removeObject:biz];
                break;
            }
        }

        [businessRelation removeObject:user];
        
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.business addObject:user];
        [businessRelation addObject:user];
       
    }
    
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
    }];
}

#pragma mark - Helper methods

- (BOOL)isBusiness:(PFUser *)user {
    for (PFUser *biz in self.business) {
        if ([biz.objectId isEqualToString:user.objectId]){
            return YES;
        }
    }
    return NO;
}

@end
