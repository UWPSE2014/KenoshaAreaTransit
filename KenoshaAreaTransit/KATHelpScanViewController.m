//
//  KATHelpScanViewController.m
//  KenoshaAreaTransit
//
//  Created by Valerie Berglind on 3/1/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import "KATHelpScanViewController.h"

@implementation KATHelpScanViewController

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
	// Do any additional setup after loading the view.
    UIPinchGestureRecognizer *pinchGestRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action: @selector(scaleTextView:)];
    
    [_scanTextView addGestureRecognizer:pinchGestRecognizer];
}

-(void)scaleTextView:(UIPinchGestureRecognizer *)pinchGestRecognizer{
    
    NSLog(@"*** Pinch: Scale: %f Velocity: %f", pinchGestRecognizer.scale, pinchGestRecognizer.velocity);
    
    UIFont *font = self.scanTextView.font;
    CGFloat pointSize = font.pointSize;
    NSString *fontName = font.fontName;
    
    pointSize = ((pinchGestRecognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;
    
    if (pointSize < 10) {
        pointSize = 10;
    }
    if (pointSize > 45) {
        pointSize = 45;
    }
    
    self.scanTextView.font = [UIFont fontWithName:fontName size:pointSize];
}

-(void)textViewDidChange:(UITextView *)textView{
    CGSize textSize = textView.contentSize;
    
    textView.frame = CGRectMake(CGRectGetMinX(textView.frame), CGRectGetMinY(textView.frame), textSize.width, textSize.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
