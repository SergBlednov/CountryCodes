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
@property (nonatomic, assign) int code;
@property (nonatomic, copy) NSString *countryFlagName;

- (NSString *)getCountryNameByCode:(int)code;

- (void)loadCountryList;

@end
