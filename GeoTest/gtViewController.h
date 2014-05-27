//
//  gtViewController.h
//  GeoTest
//
//  Created by Fan Wang on 5/27/14.
//  Copyright (c) 2014 Fan Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gtDriverMemo.h"

@interface gtViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelTankSize;
@property (weak, nonatomic) IBOutlet UITextField *myMileage;
@property (weak, nonatomic) IBOutlet UIStepper *myMileageStepper;
@property (weak, nonatomic) IBOutlet UISlider *myRefillPercentage;
@property (weak, nonatomic) IBOutlet UITextField *myRefillGallon;
@property (weak, nonatomic) IBOutlet UITextField *myGasPrice;
@property gtDriverMemo* myDriveMemo;
@property UInt64 newMileage;
@property float newRefill;
@property float newGasPrice;
@end
