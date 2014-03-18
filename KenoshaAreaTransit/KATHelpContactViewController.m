//
//  KATHelpContactViewController.m
//  KenoshaAreaTransit
//
//  Created by Valerie Berglind on 2/22/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import "KATHelpContactViewController.h"

@interface KATHelpContactViewController ()

@end

@implementation KATHelpContactViewController


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
    
    [_contactTextView addGestureRecognizer:pinchGestRecognizer];
    
}


-(void)scaleTextView:(UIPinchGestureRecognizer *)pinchGestRecognizer{
    
    NSLog(@"*** Pinch: Scale: %f Velocity: %f", pinchGestRecognizer.scale, pinchGestRecognizer.velocity);
    
    UIFont *font = self.contactTextView.font;
    CGFloat pointSize = font.pointSize;
    NSString *fontName = font.fontName;
    
    pointSize = ((pinchGestRecognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;
    
    if (pointSize < 10) {
        pointSize = 10;
    }
    if (pointSize > 45) {
        pointSize = 45;
    }
    
    self.contactTextView.font = [UIFont fontWithName:fontName size:pointSize];
}

-(void)textViewDidChange:(UITextView *)textView{
    CGSize textSize = textView.contentSize;
    
    textView.frame = CGRectMake(CGRectGetMinX(textView.frame), CGRectGetMinY(textView.frame), textSize.width, textSize.height);
    
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
