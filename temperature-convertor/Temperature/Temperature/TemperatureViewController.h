//
//  TemperatureViewController.h
//  Temperature
//
//  Created by Viacheslav Panasenko on 10/7/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *fahrenheitInput;
@property (nonatomic, weak) IBOutlet UITextField *celsiusInput;
@property (nonatomic, weak) IBOutlet UIButton *convertButton;
@property (nonatomic, assign) BOOL convertToCelsius;

- (IBAction)onFahrenheitEdited:(id)sender;
- (IBAction)onCelsiusEdited:(id)sender;

- (void)convertValues;
- (void)updateButtonState;
- (IBAction)onConvertClicked:(id)sender;
- (IBAction)onTap:(id)sender;

@end
