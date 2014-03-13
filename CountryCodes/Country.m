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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadCountryList];
    }
    return self;
}

- (void)loadCountryList
{
    self.countryListByCode = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CountryListByCode" ofType:@"plist"]];

}

- (NSString *)getCountryNameByCode:(NSString *)code
{
    NSString *countryName = [self.countryListByCode objectForKey:code];
    if (countryName != nil) {
        return countryName;
    }
    return @"Unknown country";
}

@end
