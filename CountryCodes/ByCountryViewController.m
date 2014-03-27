//
//  SecondViewController.m
//  CountryCodes
//
//  Created by Sergey Blednov on 3/12/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "ByCountryViewController.h"
#import "Country.h"

@interface ByCountryViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *countryPicker;
@property (weak, nonatomic) IBOutlet UITextField *textCountryCode;


@end

@implementation ByCountryViewController
{
    NSDictionary *_countryListByName;
    NSArray *_sortedArray;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [_countryListByName count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *keyArray = [_countryListByName allKeys];
    _sortedArray = [keyArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return _sortedArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *code = [_countryListByName objectForKey:_sortedArray[row]];
    NSString *message = [[NSString alloc] initWithFormat:@"You've selected %@.\n Country code(s) : %@", _sortedArray[row], code];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Country Codes" message:message delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    self.textCountryCode.text = code;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Country *country = [[Country alloc] init];
    _countryListByName = [[NSDictionary alloc] init];
    _countryListByName = country.countryListByName;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
