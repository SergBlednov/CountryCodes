//
//  Country.h
//  CountryCodes
//
//  Created by Sergey Blednov on 3/12/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDictionary *countryListByCode;

- (NSString *)getCountryNameByCode:(NSString *)code;

- (void)loadCountryList;

@end
