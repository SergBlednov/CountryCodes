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
@property NSArray *countryNameList;

@end

@implementation ByCountryViewController

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.countryNameList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.countryNameList[row];
}

- (IBAction)done:(id)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.countryNameList = @[@"US", @"France", @"Bulgaria", @"Slovenija", @"Taiwan", @"Latvia"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
