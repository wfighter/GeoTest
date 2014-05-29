//
//  gtViewController.m
//  GeoTest
//
//  Created by Fan Wang on 5/27/14.
//  Copyright (c) 2014 Fan Wang. All rights reserved.
//

#import "gtViewController.h"


@interface gtViewController ()

@end

@implementation gtViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //load driverMemo model
    _myDriveMemo = [[gtDriverMemo alloc] init];
    //
    _myMileage.keyboardType = UIKeyboardTypeNumberPad;
    _myRefillGallon.keyboardType = UIKeyboardTypeDecimalPad;
    [_myMileageStepper setMaximumValue:(_myDriveMemo.savedMileage+255)];
    [_myMileageStepper setMinimumValue:_myDriveMemo.savedMileage];
    [_myMileageStepper setContinuous:YES];
    [_myMileageStepper setWraps:NO];
    [_myMileageStepper setStepValue:1];
    [_gasPriceStepper setMaximumValue:5.00];
    [_gasPriceStepper setMinimumValue:0.00];
    [_gasPriceStepper setContinuous:YES];
    [_gasPriceStepper setWraps:NO];
    [_gasPriceStepper setStepValue:0.01];
    _myMileage.text=[NSString stringWithFormat:@"%llu",_myDriveMemo.savedMileage];
    [_myRefillPercentage setMaximumValue:100];
    [_myRefillPercentage setMinimumValue:0];
    _myRefillGallon.text = @"0.0";
    _myRefillPercentage.value = 0;
    _labelTankSize.text = [NSString stringWithFormat:@"/%.2f", _myDriveMemo.savedTankSize];
    _gasPricesText.text = [NSString stringWithFormat:@"$%.2f/gallon", _myDriveMemo.savedFuelPrice];
    _gasPriceStepper.value = _myDriveMemo.savedFuelPrice;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mileageTextUpdated:(id)sender {
    if(_myMileage.text.integerValue > _myDriveMemo.savedMileage){
        _newMileage = _myMileage.text.integerValue;
        _myMileageStepper.value = _newMileage;
    }
    else {
        //NSlog(@"Mileage less than last saved!");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid inputs"
                                                        message:@"Mileage is less than last saved!Please edit your history data first"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    [self.view endEditing:YES];
}

- (IBAction)mileageStepperChanged:(id)sender {
    [self.view endEditing:YES];
    _newMileage = _myMileageStepper.value;
    _myMileage.text = [[NSString alloc] initWithFormat:@"%llu", _newMileage];
}
- (IBAction)RefillGallonPercentageChanged:(id)sender {
    [self.view endEditing:YES];
    _newRefill = _myRefillPercentage.value * _myDriveMemo.savedTankSize / 100;
    _myRefillGallon.text = [[NSString alloc] initWithFormat:@"%.2f", _newRefill];
}
- (IBAction)RefillGallonNumberChanged:(id)sender {
    if(_myRefillGallon.text.integerValue <= _myDriveMemo.savedTankSize){
        _newRefill = _myRefillGallon.text.floatValue;
        _myRefillPercentage.value = (_newRefill / _myDriveMemo.savedTankSize)*100;
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid inputs"
                                                        message:@"Refill volumn is bigger than tank size!Please edit your tank size first"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    [self.view endEditing:YES];
}
- (IBAction)fuelPriceChanged:(id)sender {
    [self.view endEditing:YES];
    _gasPricesText.text = [[NSString alloc] initWithFormat:@"$%.2f/gallon", _gasPriceStepper.value];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
