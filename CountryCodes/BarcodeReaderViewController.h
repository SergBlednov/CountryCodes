//
//  BarcodeReaderViewController.h
//  CountryCodes
//
//  Created by Sergey Blednov on 3/27/14.
//  Copyright (c) 2014 Sergey Blednov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarcodeReaderViewController : UIViewController <ZBarReaderDelegate>

@property (nonatomic, retain) IBOutlet UIImageView *resultImage;
@property (nonatomic, retain) IBOutlet UITextView *resultText;

- (IBAction)scanButtonTapped;
- (IBAction)getCountryButtonTapped;

@end
