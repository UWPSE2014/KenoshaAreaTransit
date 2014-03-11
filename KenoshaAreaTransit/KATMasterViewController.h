//
//  KATMasterViewController.h
//  KenoshaAreaTransit
//
//  Created by Richard Arthur Lebbin III on 2/6/14.
//  Copyright (c) 2014 Richard Arthur Lebbin III. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KATDetailViewController;

@interface KATMasterViewController : UITableViewController

@property (strong, nonatomic) KATDetailViewController *detailViewController;

@end
