//
//  FirstViewController.m
//  CountryCodes
//
//  Created by Sergey Blednov on 3/12/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "ByCodeViewController.h"
#import "Country.h"

@interface ByCodeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textCountryCode;
@property (weak, nonatomic) IBOutlet UITextField *textCountryName;

@end

@implementation ByCodeViewController

- (NSString *)checkEnteredCode:(NSString *)code
{
    if (code.length != 3) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Country Codes Alert!" message:@"There are not 3 digits. Please correct to 3 digits" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
    return code;
}

- (IBAction)done {
    
    Country *country = [[Country alloc] init];
    NSString *code = self.textCountryCode.text;
    [self checkEnteredCode:code];
    
    NSString *countryName = [country getCountryNameByCode:code];
    
    NSLog(@"The country code entered is %@", code);
    NSLog(@"The country is %@", countryName);
    
    self.textCountryName.text = countryName;
    [self.textCountryCode resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textCountryCode becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
