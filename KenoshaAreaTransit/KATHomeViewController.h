//
//  KATHomeViewController.h
//  KenoshaAreaTransit
//
//  Created by Richard Arthur Lebbin III on 2/11/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface KATHomeViewController : UIViewController
    < ZBarReaderDelegate >

@property (nonatomic) IBOutlet UIButton *btnScan;
@property (nonatomic) IBOutlet UIButton *btnRoute;
@property (nonatomic) IBOutlet UIButton *btnHelp;
@property (nonatomic, retain) IBOutlet UITextField *resultText;

// Touch events to change button images
-(IBAction)touchScan:(id)sender;
-(IBAction)upScan:(id)sender;
-(IBAction)touchRoute:(id)sender;
-(IBAction)upInsideScan:(id)sender;
-(IBAction)upRoute:(id)sender;
-(IBAction)touchHelp:(id)sender;
-(IBAction)upHelp:(id)sender;
@end
