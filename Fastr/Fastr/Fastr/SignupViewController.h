//
//  SignupViewController.h
//  Fastr
//
//  Created by Gregory DSouza on 10/10/13.
//  Copyright (c) 2013 Fastr, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)Signup:(id)sender;

@end
