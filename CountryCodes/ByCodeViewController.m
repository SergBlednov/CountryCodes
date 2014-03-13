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


- (IBAction)done {
    
    Country *country = [[Country alloc] init];
    
    NSString *code = self.textCountryCode.text;
    NSLog(@"The country code entered is %@", code);
    
    NSString *countryName = [country getCountryNameByCode:code];
    NSLog(@"The country is %@", countryName);
    self.textCountryName.text = countryName;
    [self.textCountryCode resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
