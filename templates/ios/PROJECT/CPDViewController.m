//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDViewController.h"

@interface CPDViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *loginStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation CPDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateLoginStatus];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLoginStatus
{
    if ([[SKYContainer defaultContainer] currentUserRecordID]) {
        _loginStatusLabel.text = @"Logged in";
        _loginButton.enabled = NO;
        _signupButton.enabled = NO;
        _logoutButton.enabled = YES;
    } else {
        _loginStatusLabel.text = @"Not logged in";
        _loginButton.enabled = YES;
        _signupButton.enabled = YES;
        _logoutButton.enabled = NO;
    }
}

- (void)showAlertWithError:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

}

- (IBAction)didTapLogin:(id)sender {
    [[SKYContainer defaultContainer] loginWithUsername:_usernameField.text
                                              password:_passwordField.text
                                     completionHandler:^(SKYUser *user, NSError *error) {
                                         if (error) {
                                             [self showAlertWithError:error];
                                             return;
                                         }
                                         NSLog(@"Logged in as: %@", user);
                                         [self updateLoginStatus];
                                     }];
}

- (IBAction)didTapSignup:(id)sender {
    [[SKYContainer defaultContainer] signupWithUsername:_usernameField.text
                                               password:_passwordField.text
                                      completionHandler:^(SKYUser *user, NSError *error) {
                                          if (error) {
                                              [self showAlertWithError:error];
                                              return;
                                          }
                                          NSLog(@"Signed up as: %@", user);
                                          [self updateLoginStatus];
                                      }];
}

- (IBAction)didTapLogout:(id)sender {
    [[SKYContainer defaultContainer] logoutWithCompletionHandler:^(SKYUser *user, NSError *error) {
        if (error) {
            [self showAlertWithError:error];
            return;
        }
        NSLog(@"Logged out");
        [self updateLoginStatus];
    }];
}

@end
