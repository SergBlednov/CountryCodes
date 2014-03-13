//
//  Country.m
//  CountryCodes
//
//  Created by Sergey Blednov on 3/12/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "Country.h"
#import "ByCodeViewController.h"

@implementation Country
{
    NSMutableArray *_countryList;
}

- (id)init
{
    self = [super init];
    if (self) {
//        [self loadCountryList];
//        [self registerDefaults];
//        [self handleFirstTime];
    }
    return self;
}

- (void)loadCountryList
{
    _countryList = [[NSMutableArray alloc] initWithCapacity:20];
    
    Country *newCountry;
    
    newCountry = [[Country alloc] init];
    newCountry.name = @"US";
    newCountry.code = 0;
    [_countryList addObject:newCountry];
    
    newCountry = [[Country alloc] init];
    newCountry.name = @"France";
    newCountry.code = 300;
    [_countryList addObject:newCountry];

    newCountry = [[Country alloc] init];
    newCountry.name = @"Bulgaria";
    newCountry.code = 380;
    [_countryList addObject:newCountry];
    
    newCountry = [[Country alloc] init];
    newCountry.name = @"Slovenija";
    newCountry.code = 383;
    [_countryList addObject:newCountry];
}

- (NSString *)getCountryNameByCode:(int)code
{
    NSString *countryName = @"Unknown country";

    for (Country *country in _countryList) {
        NSLog(@"Code is: %d", code);
        if (code == country.code) {
            countryName = country.name;
        }
    }
    return countryName;
}

@end
