//
//  KATHomeViewController.m
//  KenoshaAreaTransit
//
//  Created by Richard Arthur Lebbin III on 2/11/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import "KATHomeViewController.h"

@implementation KATHomeViewController
@synthesize btnHelp, btnRoute, btnScan, resultText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [btnRoute setImage:[UIImage imageNamed:@"KATRouteButton.png"] forState:UIControlStateSelected];
        [btnHelp setImage:[UIImage imageNamed:@"KATHelpButton.png"] forState:UIControlStateSelected];
        
        [btnScan setImage:[UIImage imageNamed:@"KATScanButtonClicked.png"] forState:UIControlStateHighlighted];
        [btnRoute setImage:[UIImage imageNamed:@"KATRouteButtonClicked.png"] forState:UIControlStateHighlighted];
        [btnHelp setImage:[UIImage imageNamed:@"KatHelpButtonClicked.png"] forState:UIControlStateHighlighted];
        
        btnScan.adjustsImageWhenHighlighted = YES;
        btnRoute.adjustsImageWhenHighlighted = YES;
        btnHelp.adjustsImageWhenHighlighted = YES;
    }
    return self;
}

/*************************************
 These methods are designed to simply
 change the images of the buttons when
 the user touches them
 ************************************/
-(IBAction)touchScan:(id)sender {
    [btnScan setImage:[UIImage imageNamed:@"KATScanButtonClicked.png"] forState:UIControlStateNormal];
}

-(IBAction)upScan:(id)sender {
    
    [btnScan setImage:[UIImage imageNamed:@"KATScanButton.png"] forState:UIControlStateNormal];
}

-(IBAction)upInsideScan:(id)sender {
    @autoreleasepool {
        ZBarReaderViewController *reader = [ZBarReaderViewController new];
        
        reader.readerDelegate = self;
        reader.supportedOrientationsMask = ZBarOrientationMaskAll;
        
        ZBarImageScanner *scanner = reader.scanner;
        
        [scanner setSymbology: 0
                       config: ZBAR_CFG_ENABLE
                           to: 0];
        [scanner setSymbology: ZBAR_QRCODE
                       config: ZBAR_CFG_ENABLE
                           to: 1];
        
        [self presentViewController:reader animated:YES completion: Nil];
    }
}


-(IBAction)touchRoute:(id)sender {
    [btnRoute setImage:[UIImage imageNamed:@"KATRouteButtonClicked.png"] forState:UIControlStateNormal];
}

-(IBAction)upRoute:(id)sender {
    
    [btnRoute setImage:[UIImage imageNamed:@"KATRouteButton.png"] forState:UIControlStateNormal];
}

-(IBAction)touchHelp:(id)sender {
    [btnHelp setImage:[UIImage imageNamed:@"KATHelpButtonClicked.png"] forState:UIControlStateNormal];
}

-(IBAction)upHelp:(id)sender {
    
    [btnHelp setImage:[UIImage imageNamed:@"KATHelpButton.png"] forState:UIControlStateNormal];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info {
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    // EXAMPLE: do something useful with the barcode data
    resultText.text = symbol.data;
    
    [reader dismissViewControllerAnimated: YES
                               completion: nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(IBAction)unwindToMainMenu:(UIStoryboardSegue *)sender{
    
}

-(BOOL)shouldAutorotate{
    return NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
