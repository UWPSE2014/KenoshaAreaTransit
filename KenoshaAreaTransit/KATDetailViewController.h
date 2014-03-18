//
//  KATDetailViewController.h
//  KenoshaAreaTransit
//
//  Created by Richard Arthur Lebbin III on 2/6/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KATDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
