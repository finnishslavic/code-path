//
//  TemperatureViewController.m
//  Temperature
//
//  Created by Viacheslav Panasenko on 10/7/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.fahrenheitInput addTarget:self action:@selector(updateButtonState:) forControlEvents:UIControlEventEditingChanged];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFahrenheitEdited:(id)sender {
    self.convertToCelsius = YES;
    [self updateButtonState];
}

- (IBAction)onCelsiusEdited:(id)sender {
    self.convertToCelsius = NO;
    [self updateButtonState];
}

- (void)convertValues {
    // Uses last edited field or an empty one to determine the convertion direction.
    if ((self.convertToCelsius || self.celsiusInput.text.length == 0)
            && self.fahrenheitInput.text.length > 0) {
        float fahrenheit = [[self.fahrenheitInput text] floatValue];
        float celsius = (fahrenheit - 32) * 5/9;
        self.celsiusInput.text = [NSString stringWithFormat:@"%0.0f", celsius];
    } else {
        float celsius = [[self.celsiusInput text] floatValue];
        float fahrenheit = (celsius * 9/5) + 32;
        self.fahrenheitInput.text = [NSString stringWithFormat:@"%0.0f", fahrenheit];
    }
}

- (void)updateButtonState {
    // Instead of showing error just disable the button.
    if (self.fahrenheitInput.text.length == 0 && self.celsiusInput.text.length == 0) {
        self.convertButton.enabled = NO;
    } else {
        self.convertButton.enabled = YES;
    }
}

- (IBAction)onConvertClicked:(id)sender {
    [self convertValues];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

@end
