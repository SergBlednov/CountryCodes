//
//  BarcodeReaderViewController.m
//  CountryCodes
//
//  Created by Sergey Blednov on 3/27/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import "BarcodeReaderViewController.h"
#import "Country.h"

@interface BarcodeReaderViewController ()

@end

@implementation BarcodeReaderViewController


- (IBAction)scanButtonTapped
{
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentViewController:reader animated:YES completion:nil];
    
}

- (void)getCountryButtonTapped
{
    Country *country = [[Country alloc] init];
    NSString *barcode = self.resultText.text;
    
    if ([barcode length] > 0) {
        NSString *code = [barcode substringToIndex:3];
        NSString *countryName = [country getCountryNameByCode:code];
        NSString *message =  [[NSString alloc] initWithFormat:@"The barcode is %@\n It have been made in %@", barcode, countryName];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Country Codes" message:message  delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Country Codes" message:@"Please scan a barcode at first!"  delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)dealloc
{
    self.resultImage = nil;
    self.resultText = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return(YES);
}
    

#pragma mark - ZBarReader Delegate

- (void)imagePickerController:(UIImagePickerController *)reader didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    // EXAMPLE: do something useful with the barcode data
    self.resultText.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
    self.resultImage.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissViewControllerAnimated:YES completion:nil];
}

@end
